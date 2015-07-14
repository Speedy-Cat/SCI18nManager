//
//  SC18Manager.m
//  translationTestApp
//
//  Created by Adrian Ortuzar on 27/05/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCI18Manager.h"
#import "SCI18nModel.h"


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

-(void)translateI18nModels:(NSArray*)models forLanguage:(NSString*)language
{
    for (SCI18nModel *i18nModel in models) {
        
        if ([i18nModel.element isKindOfClass:[UILabel class]]) {
            ((UILabel*)i18nModel.element).text = [self getI18ofString:i18nModel.text forLanguage:language];
        }
        else if ([i18nModel.element isKindOfClass:[UIButton class]]){
            [((UIButton*)i18nModel.element) setTitle:[self getI18ofString:i18nModel.text forLanguage:language]
                                          forState:UIControlStateNormal];
        }
        else if([i18nModel.element isKindOfClass:[UITextField class]]){
            ((UITextField*)i18nModel.element).text = [self getI18ofString:i18nModel.text forLanguage:language];
            ((UITextField*)i18nModel.element).placeholder = [self getI18ofString:i18nModel.placeholder forLanguage:language];
            
        }
        else if([i18nModel.element isKindOfClass:[UITextView class]]){
            ((UITextView*)i18nModel.element).text = [self getI18ofString:i18nModel.text forLanguage:language];
        }
        else if([i18nModel.element isKindOfClass:[UISegmentedControl class]]){
            for(int i = 0; i18nModel.segmentTitles.count > i; i++){
                NSString *i18nKey = (NSString*)i18nModel.segmentTitles[i];
                NSString *i18nValue = [self getI18ofString:i18nKey forLanguage:language];
                [((UISegmentedControl*)i18nModel.element) setTitle:i18nValue forSegmentAtIndex:i];
            }
        }
    }
}

@end
