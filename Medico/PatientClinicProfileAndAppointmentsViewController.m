//
//  PatientClinicProfileAndAppointmentsViewController.m
//  Medico
//
//  Created by APPLE on 16/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientClinicProfileAndAppointmentsViewController.h"
#import "PatientLandingPageViewController.h"

@interface PatientClinicProfileAndAppointmentsViewController ()

@end

@implementation PatientClinicProfileAndAppointmentsViewController

- (void) homePage:(id)sender{
    PatientLandingPageViewController *PatientHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientLandingPageViewController"];
    [self.navigationController pushViewController:PatientHome animated:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Clinics And Labs";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    self.appointmentView.hidden = TRUE;
    self.profileButton.titleLabel.textColor = [UIColor blackColor];
    [self.profileButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[cancelButton setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];

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
    self.profileView.hidden = FALSE;
    self.appointmentView.hidden = TRUE;
    [self.profileButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.appointmentsButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];


}

    
   // self.profileButton.backgroundColor = [UIColor clearColor];
    //self.appointmentButton.backgroundColor = [UIColor colorWithRed:(212/255.0) green:(255/255.0) blue:(203/255.0) alpha:1];
   // self.profileButton.titleLabel.textColor = [UIColor redColor];



- (IBAction)appointmentClicked:(id)sender {
    self.appointmentView.hidden = FALSE;
    self.profileView.hidden = TRUE;
    [self.profileButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [self.appointmentsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    

}
@end
