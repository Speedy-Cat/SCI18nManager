//
//  SCInternationalizationManager.h
//  translationTestApp
//
//  Created by Adrian Ortuzar on 27/05/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 SCI18Manager is a shared object that manage the internationalization of the app.
 Once you set the languages contents, it takes care about:
 
 - knowing the current set up language of the app
 
 - knowing the order of the language
 
 - translate string previouly set up
 
 */
@interface SCI18Manager : NSObject

/**
 'sharedInstance' is the init method for SCI18Manager.
 
 Each time that you want to use SCI18Manager you have to do it throught this method.
 
 For example:
 
 @code
 NSString *currentLanguage = [[SCI18Manager SCI18Manager] currentLanguage];
 
 @return SCI18Manager singleton instanciated
 */
+ (id)sharedInstance;

/**
 Get string translated in the language that you set.
 If the i18n word does not exist will return the keyWord.
 If the language is set as nil will get the current language.
 
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

/**
 
 */
-(void)translateUIElements:(NSArray*)elements forLanguage:(NSString *)language;

@end
