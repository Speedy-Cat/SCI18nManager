//
//  PNMInternationalizationManager.m
//  translationTestApp
//
//  Created by Adrian Ortuzar on 27/05/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "PNMI18Manager.h"

@interface PNMI18Manager ()

@end

@implementation PNMI18Manager

+ (id)sharedInstance
{
    static PNMI18Manager *sharedInstance = nil;
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

- (NSString *)getI18ofString:(NSString*)string forLanguage:(NSString*)language
{
    NSDictionary *i18 = [self.languagesContent objectForKey:language];
    NSDictionary *content = [i18 objectForKey:@"content"];
    return [content objectForKey:string];
}

- (void)setContent:(NSDictionary *)content forLanguageName:(NSString *)language
{
    [self.languagesContent setObject:content forKey:language];
}

- (NSString *)currentLanguage 
{
    if (!self.currentLanguage) {
        NSArray *values = [self.languagesContent allKeys]; // Warning: this order may change.;
        if ([values count]) {
            self.currentLanguage = values[0];
        }
    }
    
    return self.currentLanguage;
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

@end