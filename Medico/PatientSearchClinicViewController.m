//
//  PatientSearchClinicViewController.m
//  Medico
//
//  Created by Apple on 10/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientSearchClinicViewController.h"
#import "PatientLandingPageViewController.h"
#import "PatientDetailSearchClinicViewController.h"
#import "CreateDoctorsClinicSettingsViewController.h"

@interface PatientSearchClinicViewController ()

@end

@implementation PatientSearchClinicViewController

- (void) homePage:(id)sender{
    PatientLandingPageViewController *PatientHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientLandingPageViewController"];
    [self.navigationController pushViewController:PatientHome animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"PatientSearchClinicViewController.m");
    
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Search Clinic & Labs";
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

- (IBAction)search:(id)sender {
    PatientDetailSearchClinicViewController *PatientHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientDetailSearchClinicViewController"];
    [self.navigationController pushViewController:PatientHome animated:YES];
}
- (IBAction)addNewClinic:(id)sender {
    CreateDoctorsClinicSettingsViewController *addClinic =
    [self.storyboard instantiateViewControllerWithIdentifier:@"CreateDoctorsClinicSettingsViewController"];
    [self.navigationController pushViewController:addClinic animated:YES];
}
@end
