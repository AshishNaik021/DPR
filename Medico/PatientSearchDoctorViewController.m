//
//  PatientSearchDoctorViewController.m
//  Medico
//
//  Created by APPLE on 20/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientSearchDoctorViewController.h"
#import "PatientLandingPageViewController.h"

@interface PatientSearchDoctorViewController ()

@end

@implementation PatientSearchDoctorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Search Doctor";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) homePage:(id)sender{
    PatientLandingPageViewController *PatientHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientLandingPageViewController"];
    [self.navigationController pushViewController:PatientHome animated:YES];
    
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
}

- (IBAction)pediatricianDoctor:(id)sender {
}
- (IBAction)dermatologistDoctor:(id)sender {
}

- (IBAction)dentistDoctor:(id)sender {
}

- (IBAction)gynecologistDoctor:(id)sender {
}

- (IBAction)generalPhysicianDoctor:(id)sender {
}
- (IBAction)homeopathyDoctor:(id)sender {
}

- (IBAction)ayurvedaDoctor:(id)sender {
}

- (IBAction)acupunctureDoctor:(id)sender {
}
@end
