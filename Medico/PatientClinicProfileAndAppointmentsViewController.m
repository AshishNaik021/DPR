//
//  PatientClinicProfileAndAppointmentsViewController.m
//  Medico
//
//  Created by APPLE on 16/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientClinicProfileAndAppointmentsViewController.h"
#import "PatientLandingPageViewController.h"
#import "PatientClinicAndLabsViewController.h"
#import "PatientYearlyPDFListOfClinicLabViewController.h"

@interface PatientClinicProfileAndAppointmentsViewController ()

@end

@implementation PatientClinicProfileAndAppointmentsViewController
@synthesize appointmentView;
@synthesize profileView;
@synthesize bookAppointmentView;
@synthesize appointmentsButton;
@synthesize profileButton;
@synthesize profileSpecialtyField;

- (void) homePage:(id)sender{
    PatientLandingPageViewController *PatientHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientLandingPageViewController"];
    [self.navigationController pushViewController:PatientHome animated:YES];
    
}
- (void)viewDidLoad {
    NSLog(@"PatientClinicProfileAndAppointmentsViewController.m");
    [super viewDidLoad];
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Clinics And Labs";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    appointmentView.hidden = TRUE;
    profileView.hidden = FALSE;
    bookAppointmentView.hidden = TRUE;
    [profileButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [profileSpecialtyField.layer setBorderWidth:1.0];

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

- (IBAction)nextAppointment:(id)sender {
}
- (IBAction)profileClicked:(id)sender {
    profileView.hidden = FALSE;
    appointmentView.hidden = TRUE;
    bookAppointmentView.hidden = TRUE;
    [profileButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [appointmentsButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];


}

- (IBAction)appointmentClicked:(id)sender {
    appointmentView.hidden = FALSE;
    profileView.hidden = TRUE;
    bookAppointmentView.hidden = TRUE;
    [profileButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [appointmentsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    

}
- (IBAction)hideDetails:(id)sender {
    PatientClinicAndLabsViewController *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientClinicAndLabsViewController"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    

}
- (IBAction)appointmentBookOnlineAM:(id)sender{
    
    bookAppointmentView.hidden = FALSE;
    appointmentView.hidden = TRUE;
    profileView.hidden = TRUE;
    
}
- (IBAction)bookNow:(id)sender {
}
- (IBAction)countDocument:(id)sender {
    PatientYearlyPDFListOfClinicLabViewController *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientYearlyPDFListOfClinicLabViewController"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}
@end
