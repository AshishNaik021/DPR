//
//  PatientSettingPageViewController.m
//  Medico
//
//  Created by APPLE on 13/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientSettingPageViewController.h"
#import "PatientLandingPageViewController.h"
#import "PatientChangePasswordViewController.h"
#import "PatientTerms&ConditionsViewController.h"
#import "HowItWorksViewController.h"


@interface PatientSettingPageViewController ()

@end

@implementation PatientSettingPageViewController

- (void) homePage:(id)sender{
    PatientLandingPageViewController *PatientHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientLandingPageViewController"];
    [self.navigationController pushViewController:PatientHome animated:YES];
    
}

- (void)viewDidLoad {
    NSLog(@"PatientSettingPageViewController.m");
    [super viewDidLoad];
    
    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    
    self.navigationItem.title = @"Settings";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];

    
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"MyDemo" ofType:@"json"];
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:NULL];
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[myJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    NSArray *arr = [json valueForKeyPath:@"demo"];
    self.patientNameLabel.text = [[arr objectAtIndex:0] objectForKey:@"Name"];

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

- (IBAction)manageProfile:(id)sender {
    
    PatientChangePasswordViewController *PatientHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientChangePasswordViewController"];
    [self.navigationController pushViewController:PatientHome animated:YES];

}
- (IBAction)termsAndCondition:(id)sender {
    
    PatientTerms_ConditionsViewController *PatientHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientTerms_ConditionsViewController"];
    [self.navigationController pushViewController:PatientHome animated:YES];

}
- (IBAction)howItWorks:(id)sender {
    
    HowItWorksViewController *PatientHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"HowItWorksViewController"];
    [self.navigationController pushViewController:PatientHome animated:YES];

}
- (IBAction)rateThisApp:(id)sender {
    
//    PatientLandingPageViewController *PatientHome =
//    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientLandingPageViewController"];
//    [self.navigationController pushViewController:PatientHome animated:YES];

}
@end
