//
//  ViewController.m
//  translationTestApp
//
//  Created by Adrian Ortuzar on 27/05/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "ViewController.h"
#import "SCI18nManager.h"
#import "SCI18nElement.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *helloLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedCtrl;
@property (weak, nonatomic) IBOutlet UITextField *longTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *longSegmentControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupI18manager];
    
    // get current language and switch
    NSString *currentLanguage = [[SCI18nManager sharedInstance] currentLanguage];
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
        [[SCI18nManager sharedInstance] setContent:jsonDic forLanguageName:language];

        //set segment
        [self.segmentedCtrl setTitle:language forSegmentAtIndex:order];
    }
}

- (void)swichtForLanguage:(NSString*)language{

    // change segment language
    int order = [[SCI18nManager sharedInstance] getOrderForLanguage:language];
    [self.segmentedCtrl setEnabled:YES forSegmentAtIndex:order];
    
    // change the language for text in elements
    NSArray *i18nSegmentKeyTitles = @[@"yellow",@"red",@"blue",@"pink"];
    NSArray *elements = @[
            [[SCI18nElement alloc] initWithLabel:self.helloLabel andKeyText:@"hello"],
            [[SCI18nElement alloc] initWithLabel:self.questionLabel andKeyText:@"how are you?"],
            [[SCI18nElement alloc] initWithTextField:self.longTextField keyText:nil andKeyPlaceholder:@"write your name here"],
            [[SCI18nElement alloc] initWithSegmentControl:self.longSegmentControl andKeyTitles:i18nSegmentKeyTitles],
            [[SCI18nElement alloc] initWithButton:self.saveButton andKeyText:@"save"]
    ];
    [[SCI18nManager sharedInstance] translateI18nElements:elements forLanguage:language];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - actions

- (IBAction)segmentCtrlAction:(id)sender {
    
    NSString *language = [[SCI18nManager sharedInstance] getLanguageForOrder:(int)self.segmentedCtrl.selectedSegmentIndex];
    [self swichtForLanguage:language];
}

@end
