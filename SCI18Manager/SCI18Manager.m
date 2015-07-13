//
//  SC18Manager.m
//  translationTestApp
//
//  Created by Adrian Ortuzar on 27/05/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCI18Manager.h"
#import "CSI18Model.h"


@interface SCI18Manager ()

@end

@implementation SCI18Manager

+ (id)sharedInstance
{
    static SCI18Manager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    if (self = [super init]) {
        self.languagesContent = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (NSString *)getI18ofString:(NSString*)word forLanguage:(NSString*)language
{
    //if language is nil
    language = (language)?language:[self currentLanguage];
    
    //get the i18n string
    NSDictionary *i18 = [self.languagesContent objectForKey:language];
    NSDictionary *content = [i18 objectForKey:@"content"];
    NSString *i18nString = [content objectForKey:word];
    
    return (i18nString)? i18nString : word;
}

- (void)setContent:(NSDictionary *)content forLanguageName:(NSString *)language
{
    [self.languagesContent setObject:content forKey:language];
}

- (NSString *)currentLanguage 
{
    if (!_currentLanguage) {
        NSArray *values = [_languagesContent allKeys]; // Warning: this order may change.;
        if ([values count]) {
            _currentLanguage = values[0];
        }
    }
    
    return _currentLanguage;
}

- (int)getOrderForLanguage:(NSString*)language
{
    NSDictionary *langsContent = self.languagesContent;
    NSDictionary *content = [langsContent objectForKey:language];
    int order = (int)[[content objectForKey:@"order"] integerValue];
    
    return order;
}

- (NSString*)getLanguageForOrder:(int)order
{
    NSString *language;

    for (NSString *languageKey in self.languagesContent) {
        NSDictionary *content = [self.languagesContent objectForKey:languageKey];
        int contentOrder = (int)[[content objectForKey:@"order"] integerValue];
        if (order == contentOrder) {
            language = languageKey;
            break;
        }
    }
    
    return language;
}

-(void)translateUIElements:(NSArray*)elements forLanguage:(NSString*)language
{
    for (CSI18Model *element in elements) {
        Class class = [element.element class];
        
        if (class == [UILabel class]) {
            ((UILabel*)element.element).text = [self getI18ofString:element.text forLanguage:language];
        }
        else if (class == [UIButton class]){
            
        }
        else if(class == [UITextField class]){
            ((UITextField*)element.element).text = [self getI18ofString:element.text forLanguage:language];
            ((UITextField*)element.element).placeholder = [self getI18ofString:element.placeholder forLanguage:language];
            
        }
        else if(class == [UITextView class]){
            ((UITextView*)element.element).text = [self getI18ofString:element.text forLanguage:language];
        }
        else if(class == [UISegmentedControl class]){
            
        }
    }
}

@end
