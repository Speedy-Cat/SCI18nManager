//
//  CSI18Model.m
//  translationTestApp
//
//  Created by Adrian Ortuzar on 13/07/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "SCI18nModel.h"

@implementation SCI18nModel

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

-(id)initWithSegmentControl:(UISegmentedControl*)segmentControl andTitles:(NSArray*)segmentTitles
{
    self = [self init];
    if (self) {
        self.element = segmentControl;
        self.segmentTitles = segmentTitles;
    }
    return self;
}

-(id)initWithButton:(UIButton*)button andText:(NSString*)text
{
    self = [self init];
    if (self) {
        self.element = button;
        self.text = text;
    }
    return self;
}


@end
