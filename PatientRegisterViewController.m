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
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    CGPoint scrollpoint = CGPointMake(0, textField.frame.origin.y-380);
    [scroll setContentOffset:scrollpoint animated:YES];
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    [scroll setContentOffset:CGPointZero animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    checked = NO;
    [scroll setScrollEnabled:YES];
    [scroll setContentSize:CGSizeMake(375, 1000)];
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
