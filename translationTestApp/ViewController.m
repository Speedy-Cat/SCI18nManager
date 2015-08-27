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
#import "SCI18nLanguage.h"

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
    SCI18nLanguage *currentLanguage = [[SCI18nManager sharedInstance] currentLanguage];
    [self swichtForLanguage:currentLanguage];
    
    // set selected segment at language control
    [self.segmentedCtrl setSelectedSegmentIndex:currentLanguage.order];
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
        SCI18nLanguage *language = [[SCI18nLanguage alloc] initWithDictionary:jsonDic];
        
        // set language in i18n manager
        NSMutableArray *languages = ((SCI18nManager*)[SCI18nManager sharedInstance]).languages;
        [languages addObject:language];

        //set segment
        [self.segmentedCtrl setTitle:language.name forSegmentAtIndex:language.order];
    }
}

- (void)swichtForLanguage:(SCI18nLanguage*)language{

    // change segment language
    //[self.segmentedCtrl setEnabled:YES forSegmentAtIndex:language.order];
    
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
    
    SCI18nLanguage *language = [[SCI18nManager sharedInstance] getLanguageForOrder:(int)self.segmentedCtrl.selectedSegmentIndex];
    ((SCI18nManager*)[SCI18nManager sharedInstance]).currentLanguage = language;
    [self swichtForLanguage:language];
}

@end
