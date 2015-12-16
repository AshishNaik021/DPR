//
//  SearchPatientViewController.m
//  Medico
//
//  Created by APPLE on 21/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "SearchPatientViewController.h"
#import "DoctorLandingPageView.h"
#import "SearchPatientForDoctorViewController.h"
#import "AddPatientViewController.h"

@interface SearchPatientViewController ()

@end

@implementation SearchPatientViewController

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}
- (void)viewDidLoad {
    NSLog(@"SearchPatientViewController.m");
    [super viewDidLoad];
    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Search Patient";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];

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

- (IBAction)searchPatient:(id)sender {
    SearchPatientForDoctorViewController *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"SearchPatientForDoctorViewController"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}
- (IBAction)puneRadio:(id)sender {
}

- (IBAction)bangloreRadio:(id)sender {
}

- (IBAction)mumbaiRadio:(id)sender {
}

- (IBAction)delhiRadio:(id)sender {
}
- (IBAction)addPatient:(id)sender {
    AddPatientViewController *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"AddPatientViewController"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
}
@end
