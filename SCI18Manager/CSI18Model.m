//
//  CSI18Model.m
//  translationTestApp
//
//  Created by Adrian Ortuzar on 13/07/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "CSI18Model.h"

@implementation CSI18Model

-(id)initWithLabel:(UILabel*)label andText:(NSString*)text
{
    self = [self init];
    if (self) {
        self.element = label;
        self.text = text;
    }
    return self;
}

-(id)initWithTextView:(UITextView*)textView andText:(NSString*)text
{
    self = [self init];
    if (self) {
        self.element = textView;
        self.text = text;
    }
    return self;
}

-(id)initWithTextField:(UITextField*)textField text:(NSString*)text andPlaceholder:(NSString*)placeholder
{
    self = [self init];
    if (self) {
        self.element = textField;
        self.text = text;
        self.placeholder = placeholder;
    }
    return self;
}

@end
