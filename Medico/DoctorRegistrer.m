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

- (void)viewDidLoad {
    [super viewDidLoad];
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
