//
//  CSI18Model.h
//  translationTestApp
//
//  Created by Adrian Ortuzar on 13/07/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 SCI18nModel is a model of data that you can use to translate UIElements like UILabels, UITextViews, UITextFields, UISegmentsControl or UIButtons.
 */
@interface SCI18nModel : NSObject

/**
 UIElement can be UILabels, UITextViews, UITextFields, UISegmentsControl or UIButtons
 */
@property (nonatomic, strong) id element;

/**
 This string is set up for the UILabel.text, UITextViews.text, UITextField.text and UIButtons title for UIControlStateNormal
 */
@property (nonatomic, strong) NSString *text;

/**
 The UITextField placeholder
 */
@property (nonatomic, strong) NSString *placeholder;

/**
 Array of string to be set up as titles in UISegmentContol
 */
@property (nonatomic, strong) NSArray *segmentTitles;

/**
 UILabel initialize
 */
-(id)initWithLabel:(UILabel*)label andText:(NSString*)text;

/**
 UITextView initialize
 */
-(id)initWithTextView:(UITextView*)textView andText:(NSString*)text;

/**
  UITextField initialize
 */
-(id)initWithTextField:(UITextField*)textField text:(NSString*)text andPlaceholder:(NSString*)placeholder;

/**
  UISegementControl initialize
 */
-(id)initWithSegmentControl:(UISegmentedControl*)segmentControl andTitles:(NSArray*)segmentTitles;

/**
  UIButton initialize
 */
-(id)initWithButton:(UIButton*)button andText:(NSString*)text;

@end
