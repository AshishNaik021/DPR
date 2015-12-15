//
//  DoctorSettingPageView.m
//  Medico
//
//  Created by APPLE on 07/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DoctorSettingPageView.h"
#import "DoctorLandingPageView.h"
#import "ManageTemplateForDoctorViewController.h"
#import "ManageDoctorsClinicSettingsViewController.h"
#import "ManageAssistant.h"
#import "DoctorChangePasswordViewController.h"

@interface DoctorSettingPageView ()

@end

@implementation DoctorSettingPageView
@synthesize manageTemplatebutton;
@synthesize manageAssistantButton;
@synthesize manageClinicsButton;
@synthesize manageProfileButton;

- (IBAction)manageProfile:(id)sender {
    DoctorChangePasswordViewController *profile =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorChangePasswordViewController"];
    [self.navigationController pushViewController:profile animated:YES];
}

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}


- (void)viewDidLoad {
    NSLog(@"DoctorSettingPageView.m");
    [super viewDidLoad];
    self.navigationItem.title = @"Settings";
    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];

    
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"MyDemo" ofType:@"json"];
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:NULL];
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[myJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    NSArray *arr = [json valueForKeyPath:@"demo"];
  //  self.doctorNameLabel.text = [[arr objectAtIndex:0] objectForKey:@"Name"];
    
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

- (IBAction)manageAssistant:(id)sender {
    ManageAssistant *assistant =
    [self.storyboard instantiateViewControllerWithIdentifier:@"ManageAssistant"];
    [self.navigationController pushViewController:assistant animated:YES];
}
- (IBAction)manageTemplate:(id)sender {
    ManageTemplateForDoctorViewController *template =
    [self.storyboard instantiateViewControllerWithIdentifier:@"ManageTemplateForDoctorViewController"];
    [self.navigationController pushViewController:template animated:YES];
}
- (IBAction)manageClinics:(id)sender {
    ManageDoctorsClinicSettingsViewController *clinic =
    [self.storyboard instantiateViewControllerWithIdentifier:@"ManageDoctorsClinicSettingsViewController"];
    [self.navigationController pushViewController:clinic animated:YES];
}
- (IBAction)smsNotification:(id)sender {
}
@end


