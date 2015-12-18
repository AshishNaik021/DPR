//
//  PatientMedicinePrescribedScheduleViewController.m
//  Medico
//
//  Created by Apple on 25/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientMedicinePrescribedScheduleViewController.h"
#import "PatientLandingPageViewController.h"

@interface PatientMedicinePrescribedScheduleViewController ()

@end


@implementation PatientMedicinePrescribedScheduleViewController
@synthesize doctorsInstructionTextView;
@synthesize scheduleTimeTextView;
@synthesize check;
@synthesize medicineReminderButton;

- (void) homePage:(id)sender{
    PatientLandingPageViewController *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientLandingPageViewController"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"PatientMedicinePrescribedScheduleViewController.m");
    
    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Medicine Schedule";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    [doctorsInstructionTextView.layer setBorderWidth:1.0];
    [scheduleTimeTextView.layer setBorderWidth:1.0];
    check = NO;

    // Do any additional setup after loading the view.
}
- (IBAction)save:(id)sender {
}

- (IBAction)medicineReminder:(id)sender {
    if(!check){
        [medicineReminderButton setImage:[UIImage imageNamed:@"ic_check_box.png"]forState:UIControlStateNormal];
        check = YES;
    }
    else if(check){
        [medicineReminderButton setImage:[UIImage imageNamed:@"ic_check_box_outline_blank.png"]forState:UIControlStateNormal];
        check = NO;
        
    }
    
}

- (IBAction)startDate:(id)sender {
}

- (IBAction)endDate:(id)sender {
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

@end
