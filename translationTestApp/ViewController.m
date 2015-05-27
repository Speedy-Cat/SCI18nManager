//
//  ViewController.m
//  translationTestApp
//
//  Created by Adrian Ortuzar on 27/05/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "ViewController.h"
#import "PNMI18Manager.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *helloLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedCtrl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    PNMLanguage currentLanguage = [[PNMI18Manager sharedManager] currentLanguage];
    
    [self swichtForLanguage:currentLanguage];
    
}

- (void)swichtForLanguage:(PNMLanguage)language{
    
    [self.segmentedCtrl setEnabled:YES forSegmentAtIndex:language];
    
    self.helloLabel.text = [[PNMI18Manager sharedManager] getI18ofString:@"hello" forLanguage:language];
    
    self.questionLabel.text = [[PNMI18Manager sharedManager] getI18ofString:@"how are you?" forLanguage:language];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - actions

- (IBAction)segmentCtrlAction:(id)sender {
    [self swichtForLanguage:(PNMLanguage)self.segmentedCtrl.selectedSegmentIndex];
    
}

@end
