//
//  DoctorRegistrer.m
//  Medico
//
//  Created by APPLE on 05/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DoctorRegistrer.h"

@interface DoctorRegistrer ()

@end

@implementation DoctorRegistrer

@synthesize checkButton;

-(IBAction)checkButton:(id)sender{
    if(!doctorchecked){
        [checkButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        doctorchecked = YES;
    }
    else if(doctorchecked){
        [checkButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        doctorchecked = NO;
        
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
    [scroll setScrollEnabled:YES];
    [scroll setContentSize:CGSizeMake(375, 1000)];
    
    doctorchecked = NO;
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

- (IBAction)addCalendar:(id)sender {
}
- (IBAction)readTermsConditions:(id)sender {
}
- (IBAction)next:(id)sender {
}
- (IBAction)addLocation:(id)sender {
}
- (IBAction)changeImage:(id)sender {
}
@end
