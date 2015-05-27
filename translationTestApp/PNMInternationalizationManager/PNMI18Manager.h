//
//  PNMInternationalizationManager.h
//  translationTestApp
//
//  Created by Adrian Ortuzar on 27/05/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PNMI18Manager : NSObject

typedef enum {
    kDutch,
    kSpanish
} PNMLanguage;

@property (nonatomic) PNMLanguage currentLanguage;

+ (id)sharedManager;

- (NSString *)getI18ofString:(NSString*)string forLanguage:(PNMLanguage)language;

@end
