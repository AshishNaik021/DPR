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
@synthesize patientArr = _patientArr;
@synthesize lastVisitedDateLabel;
@synthesize appointmentNameLable;
@synthesize nextAppointmentDateLabel;
@synthesize appointmentLabel;
@synthesize dateTextField;
@synthesize typeTextField;
@synthesize time10;
@synthesize time11;
@synthesize time1;
@synthesize time12;
@synthesize time13;
@synthesize time14;
@synthesize time15;
@synthesize time16;
@synthesize time17;
@synthesize time18;
@synthesize time2;
@synthesize time3;
@synthesize time4;
@synthesize time5;
@synthesize time6;
@synthesize time7;
@synthesize time8;
@synthesize time9;


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
    

    NSLog(@"_patientArr:%@",self.patientArr);
    NSLog(@"_doctorIdPassData:%@",_doctorIdPassData);
    NSLog(@"_patientEmailPassData:%@",_patientEmailPassData);
    NSLog(@"_appointmentDatePassData:%@",_appointmentDatePassData);
    NSLog(@"_appointmentTimePassData:%@",_appointmentTimePassData);
    [self setPatientName];
    [self lastVisitedDateLabel];
    // Do any additional setup after loading the view.
}
-(void)setLastVisitedDateLabel{
    if([[self.patientArr valueForKey:@"lastVisited"] isKindOfClass:[NSNull class]]){
    self.lastVisitedDateLabel.text = @"Not Visited";
    }
    else{
        self.lastVisitedDateLabel.text = [self.patientArr valueForKey:@"lastVisited"];
        self.lastVisitedDateLabel.text = @"Not Visited";
    }
}
-(void)setPatientName{
        NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
        
        NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/getAllPatientInformation?doctorId=%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"loggedInEmail"]];
        NSURL *url = [NSURL URLWithString:urlStr];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        NSURLResponse *response;
        NSError *error;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        NSLog(@"response status code: %ld", (long)[httpResponse statusCode]);
        if ([httpResponse statusCode] != 200) {
            [self errorMessage];
        }
        else{
            
            NSMutableArray *arrayList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
            if (error) {
                [self errorMessage];
                NSLog(@"Error : %@",error.localizedDescription);
            }
            else if([arrayList isKindOfClass:[NSNull class]]){
                [self errorMessage];
            }
            else{
                NSLog(@"");
                for (int i = 0; i < arrayList.count; i++) {
                    NSLog(@"arraylist[i]-email:%@",[arrayList[i] valueForKey:@"emailID"]);
                    NSLog(@"emial :%@",self.patientEmailPassData);
                    if ([[arrayList[i] valueForKey:@"emailID"] isEqualToString:self.patientEmailPassData]) {
                        self.appointmentNameLable.text = [arrayList[i] valueForKey:@"name"];
                    }
                }
                if ([self.appointmentNameLable.text isEqualToString:@""]) {
                    self.appointmentNameLable.text = [NSString stringWithFormat:@"NA"];
                }

                }
            }
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
-(void)errorMessage{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please try again later." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
@end
