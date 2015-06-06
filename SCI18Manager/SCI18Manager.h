//
//  SCInternationalizationManager.h
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
@interface SCI18Manager : NSObject

/**
 'sharedInstance' is the init method for PNMI18Manager.
 
 Each time that you want to use PNMI18Manager you have to do it throught this method.
 
 For example:
 
 @code
 NSString *currentLanguage = [[PNMI18Manager PNMI18Manager] currentLanguage];
 
 @return PNMI18Manager singleton instanciated
 */
+ (id)sharedInstance;

/**
 Get string translated in the language that you set.
 
 @param word
        string to translate
 @param language
        to translate the previous string
 
 @return word translated
 */
- (NSString *)getI18ofString:(NSString*)word forLanguage:(NSString*)language;


/**
 Set languages and his content to translate
 
 Example content
 @code
 {
    "language":"Dutch",
     "acronym":"du",
     "order":0,
     "content":{
        "hello":"Hallo",
        "how are you?":"Hoe gaat het met je?"
     }
 }
 
 @param content dictionary that contain the data related with a content
 @param language string of the language
 */
- (void)setContent:(NSDictionary *)content forLanguageName:(NSString *)language;

/**
 Get the order indicated in the content of the language
 
 @param language name string that you previously set for it
 
 @return oder that was seted for the language
 */
- (int)getOrderForLanguage:(NSString*)language;

/**
 Get language for determinated order
 
 @param order int
 
 @return language string
 */
- (NSString*)getLanguageForOrder:(int)order;

/**
 Contain all the languages and content that you set in 'setContent:(NSDictionary *)content forLanguageName:(NSString *)language'
 */
@property (nonatomic, strong) NSMutableDictionary *languagesContent;

/**
 Language that is currently display in the app.
 */
@property (nonatomic) NSString *currentLanguage;

@end
