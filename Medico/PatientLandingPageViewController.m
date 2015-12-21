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
#import "ManageReminderViewController.h"


@interface PatientLandingPageViewController ()

@end

@implementation PatientLandingPageViewController
@synthesize patientName = _patientName;
@synthesize patientEmail = _patientEmail;
@synthesize pNameLabel;
@synthesize homeCountPatientArr;
@synthesize doctorConsultationsTotalButton;
@synthesize diagnosticClinicsLabsTotalButton;
@synthesize appointmentTotalButton;

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

-(void)fetchHomeCountForPatient{
    
    NSLog(@"The fetchJson method is called.........");
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSString *email = @"vb1@gmail.com"; //[[NSUserDefaults standardUserDefaults] objectForKey:@"loggedInEmail"];
    
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/homeCountPatient?id=%@",email];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    //NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"Data in Array==============%@",responseStr);
    
    /* ---------- Code for Writing response data into the file -------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/homeCountPatient.json"];
    NSLog(@"%@",docPath);
    [responseStr writeToFile:docPath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
    
    /* ---------- End of Code for Writing response data into the file -------------- */
    
    
    
}

- (void)viewDidLoad {
    NSLog(@"PatientLandingPageViewController.m");
    [super viewDidLoad];
    [self fetchHomeCountForPatient];
    
    /* ----------------- Read File For Parse JSON Data -------------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/homeCountPatient.json"];
    NSLog(@"%@",docPath);
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:docPath encoding:NSUTF8StringEncoding error:NULL];
    
    NSError *error = nil;
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    
    homeCountPatientArr = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
    NSDictionary *json1 = [NSJSONSerialization JSONObjectWithData:[myJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    
    NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>%@",homeCountPatientArr);
    
    
    if (![[homeCountPatientArr valueForKey:@"doctorsCount"] isEqual:[NSNull null]]) {
        
        [doctorConsultationsTotalButton setTitle:[NSString stringWithFormat:@"%@ >",[homeCountPatientArr valueForKey:@"doctorsCount"]] forState:UIControlStateNormal];
        
    }
    
    else
    {
        [doctorConsultationsTotalButton setTitle:@"0 >" forState:UIControlStateNormal];
    }
    
    
    if (![[homeCountPatientArr valueForKey:@"clinicsCount"] isEqual:[NSNull null]]) {
        
        [diagnosticClinicsLabsTotalButton setTitle:[NSString stringWithFormat:@"%@ >",[homeCountPatientArr valueForKey:@"clinicsCount"]] forState:UIControlStateNormal];
        
    }
    
    else
    {
        [diagnosticClinicsLabsTotalButton setTitle:@"0 >" forState:UIControlStateNormal];
    }
    
    if (![[homeCountPatientArr valueForKey:@"appointmentsCount"] isEqual:[NSNull null]]) {
        
        [appointmentTotalButton setTitle:[NSString stringWithFormat:@"%@ >",[homeCountPatientArr valueForKey:@"appointmentsCount"]] forState:UIControlStateNormal];
        
    }
    
    else
    {
        [appointmentTotalButton setTitle:@"0 >" forState:UIControlStateNormal];
    }

    
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.title = @"Patient";
    self.navigationItem.hidesBackButton = YES;

    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    
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
    ManageReminderViewController *reminder =
    [self.storyboard instantiateViewControllerWithIdentifier:@"ManageReminderViewController"];
    [self.navigationController pushViewController:reminder animated:YES];
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
