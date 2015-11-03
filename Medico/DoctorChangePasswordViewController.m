//
//  DoctorChangePasswordViewController.m
//  Medico
//
//  Created by APPLE on 13/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DoctorChangePasswordViewController.h"

@interface DoctorChangePasswordViewController ()

@end

@implementation DoctorChangePasswordViewController
@synthesize checkButton;

- (void)viewDidLoad {
    NSLog(@"DoctorChangePasswordViewController.m");
    [super viewDidLoad];
    [scroll setScrollEnabled:YES];
    [scroll setContentSize:CGSizeMake(375, 1000)];
    doctor = NO;
    self.navigationItem.title = @"Profile";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];

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
- (IBAction)addCalendar:(id)sender {
}
- (IBAction)check:(id)sender {
    if(!doctor){
        [checkButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        doctor = YES;
    }
    else if(doctor){
        [checkButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        doctor = NO;
        
    }

}
- (IBAction)readTermsConditions:(id)sender {
}
- (IBAction)changePassword:(id)sender {
}
- (IBAction)save:(id)sender {
}
@end
