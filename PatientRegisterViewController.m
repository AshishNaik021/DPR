//
//  PatientRegisterViewController.m
//  Medico
//
//  Created by Apple on 01/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientRegisterViewController.h"

@interface PatientRegisterViewController ()

@end

@implementation PatientRegisterViewController

@synthesize checkButton;

-(IBAction)checkButton:(id)sender{
    if(!checked){
        [checkButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        checked = YES;
    }
    else if(checked){
        [checkButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        checked = NO;

    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    checked = NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changeImage:(id)sender {
}
- (IBAction)readTermConditions:(id)sender {
}
- (IBAction)next:(id)sender {
}
- (IBAction)addLocation:(id)sender {
}
@end
