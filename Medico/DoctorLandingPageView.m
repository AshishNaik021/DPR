//
//  DoctorLandingPageView.m
//  Medico
//
//  Created by APPLE on 07/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DoctorLandingPageView.h"
#import "LoginPage.h"
#import "DoctorManageAppointmentsViewController.h"

@interface DoctorLandingPageView ()

@end


@implementation DoctorLandingPageView
@synthesize doctorName = _doctorName;
@synthesize doctorEmail = _doctorEmail;

- (void)viewDidLoad {
    NSLog(@"DoctorLandingPageView.m");
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    NSLog(@"Name:%@ Email :%@" ,_doctorName,_doctorEmail);
    
    //    spinner = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(150, 225, 20, 30)];
    //    [spinner setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    //    spinner.color = [UIColor blueColor];
    //    spinner.center=self.view.center;
    //    [self.view addSubview:spinner];
    //
    [self setName];
    // Do any additional setup after loading the view.
}
-(void)setName{
    //    NSString *cameFrom = [self navigationController.v]
    //    NSLog(@"%@",[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2]);
    //
    //    NSString *string = [NSString stringWithFormat:[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2]];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud synchronize];
    if ([[ud objectForKey:@"loggedInUserType"] isEqualToString:@"Doctor"]) {
        self.doctorNameLabel.text = [ud objectForKey:@"loggedInDoctor"];
        NSLog(@"Login name was set");
    }
    else
        NSLog(@"Name Not Set");
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

- (IBAction)settings:(id)sender {
}
- (IBAction)logout:(id)sender {
    
    LoginPage *loginPage =
    [self.storyboard instantiateViewControllerWithIdentifier:@"LoginPage"];
    [self.navigationController pushViewController:loginPage animated:YES];
    NSLog(@"Logged Out");
}
-(void)viewDidDisappear:(BOOL)animated{
    //[spinner stopAnimating];
}

- (IBAction)searchAppointment:(id)sender {
}
- (IBAction)searchDoctor:(id)sender {
}
- (IBAction)searchClinic:(id)sender {
}
- (IBAction)patientprofile:(id)sender {
}
- (IBAction)manageFinance:(id)sender {
}
- (IBAction)manageAppointments:(id)sender {
    // [spinner startAnimating];
    DoctorManageAppointmentsViewController *objDoctorManageAppointmentsViewController =[self.storyboard instantiateViewControllerWithIdentifier:@"DoctorManageAppointmentsViewController"];
    [self.navigationController pushViewController:objDoctorManageAppointmentsViewController animated:YES];
}
@end
