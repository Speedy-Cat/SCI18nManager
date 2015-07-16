//
//  CSI18Model.m
//  translationTestApp
//
//  Created by Adrian Ortuzar on 13/07/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "SCI18nElement.h"

@implementation SCI18nElement

-(id)initWithLabel:(UILabel*)label andKeyText:(NSString*)text
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

-(id)initWithTextField:(UITextField*)textField keyText:(NSString*)text andKeyPlaceholder:(NSString*)placeholder
{
    self = [self init];
    if (self) {
        self.element = textField;
        self.text = text;
        self.placeholder = placeholder;
    }
    return self;
}

-(id)initWithSegmentControl:(UISegmentedControl*)segmentControl andKeyTitles:(NSArray*)segmentTitles
{
    self = [self init];
    if (self) {
        self.element = segmentControl;
        self.segmentTitles = segmentTitles;
    }
    return self;
}

-(id)initWithButton:(UIButton*)button andKeyText:(NSString*)text
{
    self = [self init];
    if (self) {
        self.element = button;
        self.text = text;
    }
    return self;
}


@end
