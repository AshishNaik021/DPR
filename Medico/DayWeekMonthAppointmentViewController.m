//
//  DayWeekMonthAppointmentViewController.m
//  Medico
//
//  Created by APPLE on 30/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DayWeekMonthAppointmentViewController.h"
#import "DoctorLandingPageView.h"

@interface DayWeekMonthAppointmentViewController ()

@end

@implementation DayWeekMonthAppointmentViewController
@synthesize dayContentView;
@synthesize dayTabButton;
@synthesize weekContentView;
@synthesize weekTabButton;
@synthesize monthContentView;
@synthesize monthTabButton;


- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}


- (void)viewDidLoad {
    NSLog(@"DayWeekMonthAppointmentViewController.m");
    [super viewDidLoad];
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton,addButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Manage Appointments";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    weekContentView.hidden = TRUE;
    monthContentView.hidden = TRUE;
    self.dayTabButton.titleLabel.textColor = [UIColor blackColor];
    [self.dayTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    //    spinner = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(150, 225, 20, 30)];
    //    [spinner setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    //    spinner.color = [UIColor blueColor];
    //    spinner.center=self.view.center;
    
    [self displayAppointment];
    
    
}
-(void)displayAppointment{
    // [spinner startAnimating];
    if (!dayContentView.hidden && weekContentView.hidden && monthContentView.hidden) {
        NSString *todaysDate =  [NSString stringWithFormat:[self todaysDate]];
        NSLog(@"Day View displaed: %@",todaysDate);
        NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
        
        NSString *emailid = [[NSUserDefaults standardUserDefaults] valueForKey:@"loggedInEmail"];
        NSString *clinicId = @"58";
        NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/getAllClinicsAppointment?doctorId=%@&clinicId=%@&appointmentDate=%@",emailid,clinicId,todaysDate];
        NSLog(@"url:%@",urlStr);
        NSURL *url = [NSURL URLWithString:urlStr];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        NSURLResponse *response;
        NSHTTPURLResponse *responseCode = nil;
        NSError *error;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
        int statusCode =[responseCode statusCode];
        NSLog(@"Response code:%@",statusCode);
        NSLog(@"Dictionry day=%@",dict);
        // [spinner stopAnimating];
    }
    else if(!weekContentView.hidden && dayContentView.hidden && monthContentView.hidden){
        NSLog(@"WeekView");
    }
    else{
        NSLog(@"monthview");
    }
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
-(NSString *)todaysDate{
    NSDate *todayDate = [NSDate date]; // get today date
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; // here we create NSDateFormatter object for change the Format of date..
    [dateFormatter setDateFormat:@"yyyy-MM-dd"]; //Here we can set the format which we need
    NSString *convertedDateString = [dateFormatter stringFromDate:todayDate];// here convert date in
    NSLog(@"Today's formatted date is %@",convertedDateString);
    return convertedDateString;
}

- (IBAction)dayTab:(id)sender {
    dayContentView.hidden = FALSE;
    weekContentView.hidden = TRUE;
    monthContentView.hidden = TRUE;
    [dayTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [weekTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [monthTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [self displayAppointment];
}

- (IBAction)weekTab:(id)sender {
    weekContentView.hidden = FALSE;
    dayContentView.hidden = TRUE;
    monthContentView.hidden = TRUE;
    [weekTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [dayTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [monthTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [self displayAppointment];
}

- (IBAction)monthTab:(id)sender {
    monthContentView.hidden = FALSE;
    weekContentView.hidden = TRUE;
    dayContentView.hidden = TRUE;
    [monthTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [weekTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [dayTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [self displayAppointment];
    
}

- (IBAction)monthNextDate:(id)sender {
}

- (IBAction)monthPreviousDate:(id)sender {
}

- (IBAction)dayNextDate:(id)sender {
}

- (IBAction)dayPreviousDate:(id)sender {
}

- (IBAction)weekNextDate:(id)sender {
}

- (IBAction)weekPreviousDate:(id)sender {
}

- (IBAction)weekDay1:(id)sender {
}

- (IBAction)weekDay2:(id)sender {
}

- (IBAction)weekDay3:(id)sender {
}

- (IBAction)weekDay4:(id)sender {
}

- (IBAction)weekDay5:(id)sender {
}

- (IBAction)weekDay6:(id)sender {
}

- (IBAction)weekDay7:(id)sender {
}
@end
