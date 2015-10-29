//
//  ReminderDetailsViewController.m
//  Medico
//
//  Created by APPLE on 29/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "ReminderDetailsViewController.h"
#import "DoctorLandingPageView.h"

@interface ReminderDetailsViewController ()

@end

@implementation ReminderDetailsViewController
@synthesize detailReminderArray;
@synthesize dateLabel;
@synthesize timeLabel;
@synthesize discussionLabel;

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Reminder";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    dateLabel.text = [detailReminderArray[0] objectForKey:@"date"];
    timeLabel.text = [detailReminderArray[0] objectForKey:@"time"];
    discussionLabel.text = [detailReminderArray[0] objectForKey:@"title"];

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

- (IBAction)setDateTimeAlarm:(id)sender {
}
@end
