//
//  PNMInternationalizationManager.m
//  translationTestApp
//
//  Created by Adrian Ortuzar on 27/05/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "PNMI18Manager.h"

@interface PNMI18Manager ()

@property (nonatomic, strong) NSMutableDictionary *languagesContent;

@end

@implementation PNMI18Manager

+ (id)sharedManager
{
    static PNMI18Manager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init
{
    if (self = [super init]) {
        
        // read json files
        NSString *esJsonString = [[NSBundle mainBundle] pathForResource:@"es" ofType:@"json"];
        NSString *duJsonString = [[NSBundle mainBundle] pathForResource:@"du" ofType:@"json"];
        NSArray *jsonStrings = @[duJsonString, esJsonString];
        
        self.languagesContent = [[NSMutableDictionary alloc] init];
        
        for (NSString *jsonString in jsonStrings) {
            
            NSString *myJSON = [[NSString alloc] initWithContentsOfFile:jsonString encoding:NSUTF8StringEncoding error:NULL];
            NSData *objectData = [myJSON dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:nil];
            
            [self.languagesContent setObject:[jsonDic objectForKey:@"content"] forKey:[jsonDic objectForKey:@"acronym"]];
        }
        
    }
    return self;
}


- (PNMLanguage)currentLanguage
{
    
    if(_currentLanguage){
        _currentLanguage = kDutch;
    }
    
    return _currentLanguage;
}

- (NSString *)getI18ofString:(NSString*)string forLanguage:(PNMLanguage)language
{
    
    NSDictionary *i18;
    
    switch (language) {
        case kDutch:
            i18 = [self.languagesContent objectForKey:@"du"];
            break;
        case kSpanish:
            i18 = [self.languagesContent objectForKey:@"es"];
            break;
        default:
            break;
    }
    
    return [i18 objectForKey:string];
}

@end
