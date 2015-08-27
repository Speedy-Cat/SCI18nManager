//
//  SCI18nLangModel.m
//  translationTestApp
//
//  Created by Adrian Ortuzar on 27/08/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "SCI18nLanguage.h"

@implementation SCI18nLanguage

-(id)initWithDictionary:(NSDictionary*)data
{
    self = [self init];
    if (self) {
        self.name = [data objectForKey:@"name"];
        self.order = (int)[[data objectForKey:@"order"] integerValue];
        self.content = (NSDictionary*)[data objectForKey:@"content"];
        self.acronym = [data objectForKey:@"acronym"];
    }
    return self;
}

@end
