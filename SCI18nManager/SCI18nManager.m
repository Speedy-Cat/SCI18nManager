//
//  SC18Manager.m
//  translationTestApp
//
//  Created by Adrian Ortuzar on 27/05/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCI18nManager.h"
#import "SCI18nElement.h"

@interface SCI18nManager ()

@end

@implementation SCI18nManager

+ (id)sharedInstance
{
    static SCI18nManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    if (self = [super init]) {

    }
    return self;
}

-(NSMutableArray *)languages
{
    if (!_languages) {
        _languages = [[NSMutableArray alloc] init];
    }
    return _languages;
}

- (NSString *)getI18nForKey:(NSString*)key andLanguage:(SCI18nLanguage*)language
{
    // if langName is nill use the current language
    if (!language) {
        language = [self currentLanguage];
    }
    
    //get the i18n string
    NSString *i18nString = [language.content objectForKey:key];
    
    // if the i18nString does not exist return the key
    return (i18nString)? i18nString : key;
}

- (SCI18nLanguage *)currentLanguage
{
    if (!_currentLanguage) {
        if ([self.languages count]) {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.order == 0" ];
            NSArray *result = [self.languages filteredArrayUsingPredicate:predicate];
            _currentLanguage = result[0];
        }
    }
    
    return _currentLanguage;
}

- (SCI18nLanguage*)getLanguageForOrder:(int)order
{
    SCI18nLanguage *langResult;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.order == %d", order];
    NSArray *result = [self.languages filteredArrayUsingPredicate:predicate];
    if (result.count) {
        langResult = result[0];
    }
    
    return langResult;
}

- (SCI18nLanguage*)getLanguageForLangName:(NSString*)langName
{
    SCI18nLanguage *langResult;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name == %@", langName];
    NSArray *result = [self.languages filteredArrayUsingPredicate:predicate];
    if (result.count) {
        langResult = result[0];
    }
    
    return langResult;
}


-(void)translateI18nElements:(NSArray*)models forLanguage:(SCI18nLanguage*)language
{
    for (SCI18nElement *i18nModel in models) {
        
        if ([i18nModel.element isKindOfClass:[UILabel class]]) {
            ((UILabel*)i18nModel.element).text = [self getI18nForKey:i18nModel.text andLanguage:language];
        }
        else if ([i18nModel.element isKindOfClass:[UIButton class]]){
            [((UIButton*)i18nModel.element) setTitle:[self getI18nForKey:i18nModel.text andLanguage:language]
                                          forState:UIControlStateNormal];
        }
        else if([i18nModel.element isKindOfClass:[UITextField class]]){
            ((UITextField*)i18nModel.element).text = [self getI18nForKey:i18nModel.text andLanguage:language];
            ((UITextField*)i18nModel.element).placeholder = [self getI18nForKey:i18nModel.placeholder andLanguage:language];
            
        }
        else if([i18nModel.element isKindOfClass:[UITextView class]]){
            ((UITextView*)i18nModel.element).text = [self getI18nForKey:i18nModel.text andLanguage:language];
        }
        else if([i18nModel.element isKindOfClass:[UISegmentedControl class]]){
            for(int i = 0; i18nModel.segmentTitles.count > i; i++){
                NSString *i18nKey = (NSString*)i18nModel.segmentTitles[i];
                NSString *i18nValue = [self getI18nForKey:i18nKey andLanguage:language];
                [((UISegmentedControl*)i18nModel.element) setTitle:i18nValue forSegmentAtIndex:i];
            }
        }
    }
}

@end
