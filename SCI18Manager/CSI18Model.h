//
//  CSI18Model.h
//  translationTestApp
//
//  Created by Adrian Ortuzar on 13/07/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CSI18Model : NSObject

@property (nonatomic, strong) id element;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) NSArray *segmentTitles;

-(id)initWithLabel:(UILabel*)label andText:(NSString*)text;
-(id)initWithTextView:(UITextView*)textView andText:(NSString*)text;
-(id)initWithTextField:(UITextField*)textField text:(NSString*)text andPlaceholder:(NSString*)placeholder;

@end
