//
//  ViewController.m
//  translationTestApp
//
//  Created by Adrian Ortuzar on 27/05/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "ViewController.h"
#import "SCI18Manager.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *helloLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedCtrl;
@property (weak, nonatomic) IBOutlet UITextField *longTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupI18manager];
    
    // get current language and switch
    NSString *currentLanguage = [[SCI18Manager sharedInstance] currentLanguage];
    [self swichtForLanguage:currentLanguage];
}

- (void)setupI18manager
{
    // read json files
    NSString *esJsonString = [[NSBundle mainBundle] pathForResource:@"es" ofType:@"json"];
    NSString *duJsonString = [[NSBundle mainBundle] pathForResource:@"du" ofType:@"json"];
    
    NSArray *jsonStrings = @[duJsonString, esJsonString];
    
    for (NSString *jsonString in jsonStrings) {
        
        NSString *myJSON = [[NSString alloc] initWithContentsOfFile:jsonString encoding:NSUTF8StringEncoding error:NULL];
        NSData *objectData = [myJSON dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:objectData
                                                                options:NSJSONReadingMutableContainers
                                                                  error:nil];
        NSString *language = [jsonDic objectForKey:@"language"];
        int order = (int)[[jsonDic objectForKey:@"order"] integerValue];
        
        //setupI18manager
        [[SCI18Manager sharedInstance] setContent:jsonDic forLanguageName:language];
        
        //set segment
        [self.segmentedCtrl setTitle:language forSegmentAtIndex:order];
        
    }
}

- (void)swichtForLanguage:(NSString*)language{

    //segment
    int order = [[SCI18Manager sharedInstance] getOrderForLanguage:language];
    [self.segmentedCtrl setEnabled:YES forSegmentAtIndex:order];
    
    //labels
    self.helloLabel.text = [[SCI18Manager sharedInstance] getI18ofString:@"hello" forLanguage:language];
    self.questionLabel.text = [[SCI18Manager sharedInstance] getI18ofString:@"how are you?" forLanguage:language];
    
    self.longTextField.placeholder = [[SCI18Manager sharedInstance] getI18ofString:@"write your name here" forLanguage:language];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - actions

- (IBAction)segmentCtrlAction:(id)sender {
    
    NSString *language = [[SCI18Manager sharedInstance] getLanguageForOrder:(int)self.segmentedCtrl.selectedSegmentIndex];
    [self swichtForLanguage:language];
}

- (NSString*)getLanguageFromSegmentCtrlIndex:(int)index
{
    NSString *language;
    
    switch (index) {
        case 0:
            language = @"du";
            break;
        case 1:
            language = @"es";
            break;
        default:
            break;
    }
    
    return language;
}

- (int)getIndexSegmentCtrlForLanguage:(NSString*)language
{
    int index;
    
    if ([language isEqualToString:@"du"]) {
        index = 0;
    }else if([language isEqualToString:@"es"]){
        index = 1;
    }
    
    return index;
}

@end
