//
//  LastVisitedConsultationViewController.m
//  Medico
//
//  Created by APPLE on 24/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "LastVisitedConsultationViewController.h"
#import "DoctorLandingPageView.h"
#import "PatientProfileViewController.h"

@interface LastVisitedConsultationViewController ()

@end

@implementation LastVisitedConsultationViewController
@synthesize visitedButton;
@synthesize notVisitedButton;
@synthesize isVisited;
@synthesize isNotVisitedClicked;
@synthesize isVisitedClicked;
@synthesize star;
@synthesize returnString;
@synthesize patientArr = _patientArr;

- (void) homePage:(id)sender{
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"loggedInUserType"] isEqualToString:@"Doctor"]) {
        DoctorLandingPageView *DoctorHome =
        [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
        [self.navigationController pushViewController:DoctorHome animated:YES];
    }
    else{
        NSLog(@"Navigate to patient");
    }
}
- (void)viewDidLoad {
    NSLog(@"LastVisitedConsultationViewController.m");
    [super viewDidLoad];
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Consultations";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    isVisited = NO;
    isNotVisitedClicked = NO;
    isVisitedClicked = NO;
    star = [NSString stringWithFormat:@"0"];
    [self notVisitedClickedChangeRadioButton];
    self.addVisiteSummaryButton.hidden = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
// emptyStar.jpeg
// filledStar.jpeg

- (IBAction)ratingOne:(id)sender{
    [self visitedClickedChangeRadioButton];
    UIImage *ckbtnImage = [UIImage imageNamed:@"filledStar.jpeg"];
    UIImage *unckbtnImage = [UIImage imageNamed:@"emptyStar.jpeg"];
    [self.ratingOneButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingTwoButton setImage:unckbtnImage forState:UIControlStateNormal];
    [self.ratingThreeButton setImage:unckbtnImage forState:UIControlStateNormal];
    [self.ratingFourButton setImage:unckbtnImage forState:UIControlStateNormal];
    [self.ratingFiveButton setImage:unckbtnImage forState:UIControlStateNormal];
    star = [NSString stringWithFormat:@"1"];
}
- (IBAction)ratingTwo:(id)sender{
    [self visitedClickedChangeRadioButton];
    UIImage *ckbtnImage = [UIImage imageNamed:@"filledStar.jpeg"];
    UIImage *unckbtnImage = [UIImage imageNamed:@"emptyStar.jpeg"];
    [self.ratingOneButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingTwoButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingThreeButton setImage:unckbtnImage forState:UIControlStateNormal];
    [self.ratingFourButton setImage:unckbtnImage forState:UIControlStateNormal];
    [self.ratingFiveButton setImage:unckbtnImage forState:UIControlStateNormal];
    star = [NSString stringWithFormat:@"2"];
}
- (IBAction)ratingThree:(id)sender{
    [self visitedClickedChangeRadioButton];
    UIImage *ckbtnImage = [UIImage imageNamed:@"filledStar.jpeg"];
    UIImage *unckbtnImage = [UIImage imageNamed:@"emptyStar.jpeg"];
    [self.ratingOneButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingTwoButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingThreeButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingFourButton setImage:unckbtnImage forState:UIControlStateNormal];
    [self.ratingFiveButton setImage:unckbtnImage forState:UIControlStateNormal];
    star = [NSString stringWithFormat:@"3"];
}
- (IBAction)ratingFour:(id)sender{
    [self visitedClickedChangeRadioButton];
    UIImage *ckbtnImage = [UIImage imageNamed:@"filledStar.jpeg"];
    UIImage *unckbtnImage = [UIImage imageNamed:@"emptyStar.jpeg"];
    [self.ratingOneButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingTwoButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingThreeButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingFourButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingFiveButton setImage:unckbtnImage forState:UIControlStateNormal];
    star = [NSString stringWithFormat:@"4"];
}
- (IBAction)ratingFive:(id)sender{
    [self visitedClickedChangeRadioButton];
    UIImage *ckbtnImage = [UIImage imageNamed:@"filledStar.jpeg"];
    [self.ratingOneButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingTwoButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingThreeButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingFourButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingFiveButton setImage:ckbtnImage forState:UIControlStateNormal];
    star = [NSString stringWithFormat:@"5"];
}

- (IBAction)visitedClicked:(id)sender {
    [self visitedClickedChangeRadioButton];
}

-(IBAction)addVisiteSummary:(id)sender{
}

- (IBAction)notVisitedClicked:(id)sender {
    [self notVisitedClickedChangeRadioButton];
}
-(void)toggleHiden:(BOOL) value{
    self.labelRating.hidden = value;
    self.labelReviews.hidden = value;
    self.ratingFiveButton.hidden = value;
    self.ratingFourButton.hidden = value;
    self.ratingThreeButton.hidden = value;
    self.ratingTwoButton.hidden = value;
    self.ratingOneButton.hidden = value;
    self.reviewsTextField.hidden = value;
    self.addVisiteSummaryButton.hidden = value;
    if (value) {
        star = [NSString stringWithFormat:@"0"];
        UIImage *unckbtnImage = [UIImage imageNamed:@"emptyStar.jpeg"];
        [self.ratingOneButton setImage:unckbtnImage forState:UIControlStateNormal];
        [self.ratingTwoButton setImage:unckbtnImage forState:UIControlStateNormal];
        [self.ratingThreeButton setImage:unckbtnImage forState:UIControlStateNormal];
        [self.ratingFourButton setImage:unckbtnImage forState:UIControlStateNormal];
        [self.ratingFiveButton setImage:unckbtnImage forState:UIControlStateNormal];
        [self.reviewsTextField setText:@""];
    }
}
- (IBAction)done:(id)sender{
    if (isVisitedClicked) {
        [self validateRating];
    }
    else{
        NSLog(@"Not Visited");
    }
}
-(void)validateRating{
    if (![star isEqualToString:@"0"]) {
        if(![self.reviewsTextField.text isEqualToString:@""])
            [self submitReview];
        else
            [self alertForTextReview];
    }
    else
        [self alertForReview];
}
-(void)alertForTextReview{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please Enter Comments for review." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(void)submitReview{
    returnString = @"";
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    NSURL * url = [NSURL URLWithString:@"http://139.162.31.36:9000/saveFeedBackPatient"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    NSLog(@"_patientArr:%@",_patientArr);
    
    NSString *appointmentDate =[NSString stringWithFormat:[_patientArr valueForKey:@"appointmentDate"]];
    NSString *appointmentTime = [NSString stringWithFormat:[_patientArr valueForKey:@"appointmentTime"]];
    NSString *clinicID = [NSString stringWithFormat:[_patientArr valueForKey:@"appointmentClinicId"]];
    NSString *doctorID = [NSString stringWithFormat:[_patientArr valueForKey:@"doctorId"]];
    NSString *patientID =    [NSString stringWithFormat:[_patientArr valueForKey:@"emailID"]];
    NSString *reviews = [NSString stringWithFormat:@"%@",self.reviewsTextField.text];
    NSLog(@"Star Value:%@",star);
    NSString *visited = [NSString stringWithFormat:@"visited"];
    NSString * params =[NSString stringWithFormat:@"\{\"appointmentDate\":\"%@\",\"appointmentTime\":\"%@\",\"clinicId\":\"%@\",\"doctorId\":\"%@\",\"patientId\":\"%@\",\"reviews\":\"%@\",\"star\":\"%@\",\"visited\":\"%@\"}",appointmentDate,appointmentTime,clinicID,doctorID,patientID,reviews,star,visited];
    //backup
    //    NSString * params =[NSString stringWithFormat:@"\{\"appointmentDate\":\"%@\",\"appointmentTime\":\"%@\",\"clinicId\":\"%@\",\"doctorId\":\"%@\",\"patientId\":\"%@\",\"reviews\":\"reviews\",\"star\":\"1\",\"visited\":\"%@\"}",[NSString stringWithFormat:[_patientArr valueForKey:@"appointmentDate"]],[NSString stringWithFormat:[_patientArr valueForKey:@"appointmentTime"]],[NSString stringWithFormat:[_patientArr valueForKey:@"appointmentClinicId"]],[NSString stringWithFormat:[_patientArr valueForKey:@"doctorId"]],[NSString stringWithFormat:[_patientArr valueForKey:@"patientId"]],reviews,star,[NSString stringWithFormat:[_patientArr valueForKey:@"visited"]]];
    //    NSLog(@"%@",params);
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                           NSLog(@"Response:%@ Error : %@\n", response, error);
                                                           //NSLog(@"Response Code:%@",[response valueForKey:@"status code"]);
                                                           if(error == nil)
                                                           {
                                                               returnString = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                                               NSLog(@"Data = %@",returnString);
                                                               NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                               NSLog(@"response status code: %ld", (long)[httpResponse statusCode]);
                                                               if ([httpResponse statusCode] == 200) {
                                                                   [self parseJSON:returnString];
                                                               } else {
                                                                   [self errorMessage];
                                                               }
                                                           }
                                                           else if ([error.localizedDescription isEqualToString:@"The request timed out."]){
                                                               [self requestTimeOut];
                                                           }
                                                           else {
                                                               [self errorMessage];
                                                           }
                                                           
                                                       }];
    [dataTask resume];
}
-(void)errorMessage{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please try again later." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(void)requestTimeOut{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please try again later." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(void)parseJSON : (NSString *)responseData{
    NSString * jsonString = responseData;
    //NSStringEncoding  encoding;
    NSData * jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError * error=nil;
    NSDictionary * parsedData = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    NSLog(@"NSDictionery:%@",parsedData);
    //    //NSString *email = [NSString stringWithFormat:[parsedData valueForKey:@"emailID"]];
    //    if ([userType isEqualToString:@"Doctor"]) {
    //        DoctorLandingPageView *doctorHome =
    //        [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    //        doctorHome.doctorEmail = [NSString stringWithFormat:emailField.text];
    //        NSLog(@"email passing %@",doctorHome.doctorEmail);
    //        NSString *drName = [self getDoctorName];
    //        doctorHome.doctorName = drName;
    //        NSLog(@"Return block doctor name:========%@",drName);
    //        [self.navigationController pushViewController:doctorHome animated:YES];
    //        [spinner stopAnimating];
    //    }
}

-(void)alertForReview{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please Rate from 1 - 5." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(void)visitedClickedChangeRadioButton{
    UIImage *ckbtnImage = [UIImage imageNamed:@"checkRadio.png"];
    [self.visitedButton setImage:ckbtnImage forState:UIControlStateNormal];
    UIImage *unckbtnImage = [UIImage imageNamed:@"unchechRadio.png"];
    [self.notVisitedButton setImage:unckbtnImage forState:UIControlStateNormal];
    [self toggleHiden:NO];
    isVisitedClicked = YES;
    isNotVisitedClicked = NO;
}
-(void)notVisitedClickedChangeRadioButton{
    UIImage *ckbtnImage = [UIImage imageNamed:@"checkRadio.png"];
    [self.notVisitedButton setImage:ckbtnImage forState:UIControlStateNormal];
    UIImage *unckbtnImage = [UIImage imageNamed:@"unchechRadio.png"];
    [self.visitedButton setImage:unckbtnImage forState:UIControlStateNormal];
    [self toggleHiden:YES];
    isVisitedClicked = NO;
    isNotVisitedClicked = YES;
}
@end
