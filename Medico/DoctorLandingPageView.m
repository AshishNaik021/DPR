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
#import "PatientProfileViewController.h"
#import "DoctorManageFinanceViewController.h"
#import "DoctorFeedBackViewController.h"
#import "ManageReminderViewController.h"
#import "SearchPatientViewController.h"
#import "PatientSearchDoctorViewController.h"
#import "SearchClinicView.h"
#import "DoctorSettingPageView.h"


@interface DoctorLandingPageView ()

@end


@implementation DoctorLandingPageView
@synthesize doctorName = _doctorName;
@synthesize doctorEmail = _doctorEmail;
@synthesize homeCountArr;
@synthesize patientProfileHomeCountButton;
@synthesize manageAppointmentHomeCountButton;
@synthesize manageFinanceHomeCountButton;
@synthesize feedbackHomeCountButton;


-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}

-(void)fetchHomeCountForDoctor{
    
    NSLog(@"The fetchJson method is called.........");
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/homeCountDoctor?doctorId=%@",_doctorEmail];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    //NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"Data in Array==============%@",responseStr);
    
    /* ---------- Code for Writing response data into the file -------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/homeCountDoctor.json"];
    NSLog(@"%@",docPath);
    [responseStr writeToFile:docPath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
    
    /* ---------- End of Code for Writing response data into the file -------------- */
    
    
    
}

- (void)viewDidLoad {
    NSLog(@"DoctorLandingPageView.m");
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    NSLog(@"Name:%@ Email :%@" ,_doctorName,_doctorEmail);
    [self fetchHomeCountForDoctor];
    
    /* ----------------- Read File For Parse JSON Data -------------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/homeCountDoctor.json"];
    NSLog(@"%@",docPath);
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:docPath encoding:NSUTF8StringEncoding error:NULL];
    
    NSError *error = nil;
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    
    homeCountArr = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
    NSDictionary *json1 = [NSJSONSerialization JSONObjectWithData:[myJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    
    NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>%@",homeCountArr);
    
    
    if (![[homeCountArr valueForKey:@"patientCount"] isEqual:[NSNull null]]) {
        
        [patientProfileHomeCountButton setTitle:[NSString stringWithFormat:@"%@ >",[homeCountArr valueForKey:@"patientCount"]] forState:UIControlStateNormal];
        
    }
    
    else
    {
        [patientProfileHomeCountButton setTitle:@"0 >" forState:UIControlStateNormal];
    }
    
    
    if (![[homeCountArr valueForKey:@"appointments"] isEqual:[NSNull null]]) {
        
        [manageAppointmentHomeCountButton setTitle:[NSString stringWithFormat:@"%@ >",[homeCountArr valueForKey:@"appointments"]] forState:UIControlStateNormal];
        
    }
    
    else
    {
        [manageAppointmentHomeCountButton setTitle:@"0 >" forState:UIControlStateNormal];
    }
    
    if (![[homeCountArr valueForKey:@"financeCount"] isEqual:[NSNull null]]) {
        
        [manageFinanceHomeCountButton setTitle:[NSString stringWithFormat:@"%@ >",[homeCountArr valueForKey:@"financeCount"]] forState:UIControlStateNormal];
        
    }
    
    else
    {
        [manageFinanceHomeCountButton setTitle:@"0 >" forState:UIControlStateNormal];
    }
    
    
    // self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background final v1.0-0.png"]];
    // self.view.backgroundColor = [UIColor clearColor];
    //  UIGraphicsBeginImageContext(self.view.frame.size);
    //  [[UIImage imageNamed:@"Background final v1.0-0.png"] drawInRect:self.view.bounds];
    //  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //  UIGraphicsEndImageContext();
    //  self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    //  self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    //    [self.navigationController.navigationBar setTranslucent:NO];
    //  self.navigationController.navigationBar.hidden = YES;
    
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
    DoctorSettingPageView *setting =[self.storyboard instantiateViewControllerWithIdentifier:@"DoctorSettingPageView"];
    [self.navigationController pushViewController:setting animated:YES];
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
-(void)viewDidDisappear:(BOOL)animated{
    //[spinner stopAnimating];
}

- (IBAction)searchAppointment:(id)sender {
    ManageReminderViewController *objManageReminderViewController =[self.storyboard instantiateViewControllerWithIdentifier:@"ManageReminderViewController"];
    [self.navigationController pushViewController:objManageReminderViewController animated:YES];
}

- (IBAction)searchDoctor:(id)sender {
    PatientSearchDoctorViewController *objPatientSearchDoctorViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PatientSearchDoctorViewController"];
    [self.navigationController pushViewController:objPatientSearchDoctorViewController animated:YES];
}
- (IBAction)searchClinic:(id)sender {
    SearchClinicView *clinic = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchClinicView"];
    [self.navigationController pushViewController:clinic animated:YES];
}
- (IBAction)patientprofile:(id)sender {
    PatientProfileViewController *objDoctorManageAppointmentsViewController =[self.storyboard instantiateViewControllerWithIdentifier:@"PatientProfileViewController"];
    [self.navigationController pushViewController:objDoctorManageAppointmentsViewController animated:YES];
}
- (IBAction)manageFinance:(id)sender {
    DoctorManageFinanceViewController *objDoctorManageAppointmentsViewController =[self.storyboard instantiateViewControllerWithIdentifier:@"DoctorManageFinanceViewController"];
    [self.navigationController pushViewController:objDoctorManageAppointmentsViewController animated:YES];
    
}
- (IBAction)manageAppointments:(id)sender {
    // [spinner startAnimating];
    DoctorManageAppointmentsViewController *objDoctorManageAppointmentsViewController =[self.storyboard instantiateViewControllerWithIdentifier:@"DoctorManageAppointmentsViewController"];
    [self.navigationController pushViewController:objDoctorManageAppointmentsViewController animated:YES];
}
- (IBAction)feedBck:(id)sender {
    DoctorFeedBackViewController *objDoctorManageAppointmentsViewController =[self.storyboard instantiateViewControllerWithIdentifier:@"DoctorFeedBackViewController"];
    [self.navigationController pushViewController:objDoctorManageAppointmentsViewController animated:YES];
    
}
- (IBAction)searchPatient:(id)sender {
    SearchPatientViewController *objSearchPatientViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchPatientViewController"];
    [self.navigationController pushViewController:objSearchPatientViewController animated:YES];
}
@end
