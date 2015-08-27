//
//  SCI18nLangModel.h
//  translationTestApp
//
//  Created by Adrian Ortuzar on 27/08/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Data model:
 
 @code
 {
     "name":"Dutch",
     "acronym":"du",
     "order":0,
     "content":{
         "hello":"Hallo",
         "how are you?":"Hoe gaat het met je?",
         "save":"Save",
         "write your name here":"schrijf je naam hier",
         "yellow":"Geel",
         "red":"Rood",
         "pink":"Roze",
         "blue":"Blauw"
     }
 }
 */
@interface SCI18nLanguage : NSObject

/**
 Language name
 */
@property (nonatomic, strong) NSString *name;

/**
 Language acronym.
 Each language is assigned a two-letter or three-letter lowercase abbreviation.
 https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
 */
@property (nonatomic, strong) NSString *acronym;

/**
 Order of the language to be listed
 We assume that the first one is the default one.
 */
@property (nonatomic) int order;

/**
 Content is a dictionary with key and values of the i18n.
 */
@property (nonatomic, strong) NSDictionary *content;


/**
 Init with dictionary of data:
 
 @code
 {
     "name":"Dutch",
     "acronym":"du",
     "order":0,
     "content":{
         "hello":"Hallo",
         "how are you?":"Hoe gaat het met je?",
         "save":"Save",
         "write your name here":"schrijf je naam hier",
         "yellow":"Geel",
         "red":"Rood",
         "pink":"Roze",
         "blue":"Blauw"
     }
 }
 */
-(id)initWithDictionary:(NSDictionary*)data;

@end
