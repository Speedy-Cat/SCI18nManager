//
//  SCInternationalizationManager.h
//  translationTestApp
//
//  Created by Adrian Ortuzar on 27/05/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCI18nLanguage.h"

/**
 Nofication each time currentLanguage change
 */
#define kSCI18nCurrentLanguageChanged @"kSCI18nCurrentLanguageChanged"

/**
 Key to save in user defaults the current language name
 */
#define kSC18nCurrentLanguageNameUserDefaults @"kSC18nCurrentLanguageNameUserDefaults"

/**
 SCI18Manager is a shared object that manage the internationalization of the app.
 Once you set the languages contents, it takes care about:
 
 - knowing the current set up language of the app
 
 - knowing the order of the language
 
 - translate string previouly set up
 
 */
@interface SCI18nManager : NSObject

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
 
 @param key
        string to translate
 @param language
        to translate the previous string
 
 @return word translated
 */
- (NSString *)getI18nForKey:(NSString*)key andLanguage:(SCI18nLanguage*)language;


/**
 Get language for determinated order
 
 @param order int
 
 @return language string
 */
- (SCI18nLanguage*)getLanguageForOrder:(int)order;


/**
 Array of SCI18nLangModel
 */
@property (nonatomic, strong) NSMutableArray *languages;

/**
 Language that is currently display in the app.
 */
@property (nonatomic) SCI18nLanguage *currentLanguage;

/**
 Translate a array of SCI18nModels for language.

 @param elements array of SCI18nElement to be translated
 
 @param language name string that you previously set for it
 
 */
-(void)translateI18nElements:(NSArray*)elements forLanguage:(SCI18nLanguage *)language;

@end
