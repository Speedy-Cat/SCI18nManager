//
//  PNMInternationalizationManager.h
//  translationTestApp
//
//  Created by Adrian Ortuzar on 27/05/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 PNMI18Manager is a shared object that manage the internationalization of the app.
 Once you set the languages contents, it takes care about:
 
 - knowing the current set up language of the app
 
 - knowing the order of the language
 
 - translate string previouly set up
 
 */
@interface PNMI18Manager : NSObject

/**
 Explanation of this method
 */
+ (id)sharedInstance;

/**
 
 */
- (NSString *)getI18ofString:(NSString*)string forLanguage:(NSString*)language;
- (void)setContent:(NSDictionary *)content forLanguageName:(NSString *)language;
- (int)getOrderForLanguage:(NSString*)language;
- (NSString*)getLanguageForOrder:(int)order;

@property (nonatomic, strong) NSMutableDictionary *languagesContent;
@property (nonatomic) NSString *currentLanguage;

@end
