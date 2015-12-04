//
//  DoctorBookAppointmentViewController.m
//  Medico
//
//  Created by APPLE on 24/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DoctorBookAppointmentViewController.h"
#import "DoctorLandingPageView.h"

@interface DoctorBookAppointmentViewController ()

@end

@implementation DoctorBookAppointmentViewController
@synthesize doctorIdPassData = _doctorIdPassData;
@synthesize patientEmailPassData = _patientEmailPassData;
@synthesize appointmentDatePassData = _appointmentDatePassData;
@synthesize appointmentTimePassData = _appointmentTimePassData;

- (void) homePage:(id)sender{
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"loggedInUserType"]){
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    }
    else{
        NSLog(@"Redirect to patient landing page");
    }
}

- (void)viewDidLoad {
    NSLog(@"DoctorBookAppointmentViewController.m");
    [super viewDidLoad];
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Consultations";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    

    
    NSLog(@"_doctorIdPassData:%@",_doctorIdPassData);
    NSLog(@"_patientEmailPassData:%@",_patientEmailPassData);
    NSLog(@"_appointmentDatePassData:%@",_appointmentDatePassData);
    NSLog(@"_appointmentTimePassData:%@",_appointmentTimePassData);
    self.appointmentNameLable.text = @"Vitthal's Appointmnt";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dmainispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changeAppointmentDate:(id)sender {
}
- (IBAction)timeClicked1:(id)sender {
}
- (IBAction)timeClicked2:(id)sender {
}

- (IBAction)timeClicked3:(id)sender {
}

- (IBAction)timeClicked4:(id)sender {
}

- (IBAction)timeClicked5:(id)sender{
    
}
- (IBAction)timeClicked6:(id)sender{
    
}
- (IBAction)timeClicked7:(id)sender{
    
}
- (IBAction)timeClicked8:(id)sender{
    
}
- (IBAction)timeClicked9:(id)sender{
    
}
- (IBAction)timeClicked10:(id)sender{
    
}
- (IBAction)timeClicked11:(id)sender{
    
}
- (IBAction)timeClicked12:(id)sender{
    
}
- (IBAction)timeClicked13:(id)sender{
    
}
- (IBAction)timeClicked14:(id)sender{
    
}
- (IBAction)timeClicked15:(id)sender{
    
}
- (IBAction)timeClicked16:(id)sender{
    
}
- (IBAction)timeClicked17:(id)sender{
    
}
- (IBAction)timeClicked18:(id)sender{
    
}
- (IBAction)doneButtonClicked:(id)sender{
    
}

@end
