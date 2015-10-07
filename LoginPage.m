//
//  LoginPage.m
//  Medico
//
//  Created by Apple on 02/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "LoginPage.h"
#import "DoctorLandingPageView.h"


@interface LoginPage ()

@end

@implementation LoginPage


- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)validate:(id)sender {
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

- (IBAction)forgotPassword:(id)sender {
}

- (IBAction)doctorRegistration:(id)sender {
}

- (IBAction)patientRegistration:(id)sender {
}

- (IBAction)assistantRegistration:(id)sender {
}
- (IBAction)knowMore:(id)sender {
}
@end
