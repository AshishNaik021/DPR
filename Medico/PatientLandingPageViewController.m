//
//  PatientLandingPageViewController.m
//  Medico
//
//  Created by APPLE on 15/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientLandingPageViewController.h"
#import "LoginPage.h"
#import "PatientSettingPageViewController.h"
#import "PatientDoctorConsultationsViewController.h"
#import "PatientClinicAndLabsViewController.h"
#import "PatientManageAppointmentViewController.h"
#import "PatientSearchDoctorViewController.h"
#import "PatientSearchClinicViewController.h"


@interface PatientLandingPageViewController ()

@end

@implementation PatientLandingPageViewController
@synthesize patientName = _patientName;
@synthesize patientEmail = _patientEmail;
@synthesize pNameLabel;

-(void)setName{
    //    NSString *cameFrom = [self navigationController.v]
    //    NSLog(@"%@",[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2]);
    //
    //    NSString *string = [NSString stringWithFormat:[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2]];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    if ([[ud objectForKey:@"loggedInUserType"] isEqualToString:@"Patient"]) {
        pNameLabel.text = [ud objectForKey:@"loggedInPatient"];
        self.patientName = [ud objectForKey:@"loggedInPatient"];
        NSLog(@"Login name was set");
    }
    else
        NSLog(@"Name Not Set");
}


- (void)viewDidLoad {
    NSLog(@"PatientLandingPageViewController.m");
    [super viewDidLoad];
    
 
    self.navigationItem.title = @"Welcome";
    self.navigationItem.hidesBackButton = YES;

    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    [self setName];

    // Do any additional setup after loading the view.
}



- (IBAction)logout:(id)sender {
    
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    [[NSUserDefaults standardUserDefaults]synchronize ];
    
    LoginPage *loginPage =
    [self.storyboard instantiateViewControllerWithIdentifier:@"LoginPage"];
    [self.navigationController pushViewController:loginPage animated:YES];
    NSLog(@"Logged Out");    
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

- (IBAction)doctorConsultations:(id)sender {
    PatientDoctorConsultationsViewController *consultation =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientDoctorConsultationsViewController"];
    [self.navigationController pushViewController:consultation animated:YES];
}
- (IBAction)diagnosticClinicsLabs:(id)sender {
    PatientClinicAndLabsViewController *clinic =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientClinicAndLabsViewController"];
    [self.navigationController pushViewController:clinic animated:YES];
}
- (IBAction)appointment:(id)sender {
    PatientManageAppointmentViewController *appointment =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientManageAppointmentViewController"];
    [self.navigationController pushViewController:appointment animated:YES];
}
- (IBAction)reminder:(id)sender {
}
- (IBAction)searchDoctor:(id)sender {
    PatientSearchDoctorViewController *searchDoc =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientSearchDoctorViewController"];
    [self.navigationController pushViewController:searchDoc animated:YES];
}
- (IBAction)searchClinic:(id)sender {
    PatientSearchClinicViewController *searchClinic =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientSearchClinicViewController"];
    [self.navigationController pushViewController:searchClinic animated:YES];
}
- (IBAction)setting:(id)sender {
    PatientSettingPageViewController *setting =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientSettingPageViewController"];
    [self.navigationController pushViewController:setting animated:YES];

}
@end
