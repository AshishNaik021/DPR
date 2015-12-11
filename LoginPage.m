//
//  LoginPage.m
//  Medico
//
//  Created by Apple on 02/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "LoginPage.h"
#import "DoctorLandingPageView.h"
#import "PatientLandingPageViewController.h"
#import "DoctorRegistrer.h"
#import "PatientRegisterViewController.h"
#import "AssistantRegister.h"
#import "ForgotPasswordView.h"
#import "AboutMedicoViewController.h"

@interface LoginPage ()

@end

@implementation LoginPage

@synthesize emailField;
@synthesize passwordField;
@synthesize loginButton;
@synthesize forgotButton;
@synthesize regDoctor;
@synthesize regAssistant;
@synthesize regPatient;
@synthesize knowMore;
@synthesize returnString;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"LoginPage.m");
    spinner = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(150, 225, 20, 30)];
    [spinner setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    spinner.color = [UIColor blueColor];
    spinner.center=self.view.center;
    [self.view addSubview:spinner];
    self.navigationItem.hidesBackButton = YES;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background final640_940.png"]];
     self.view.backgroundColor = [UIColor clearColor];
        UIGraphicsBeginImageContext(self.view.frame.size);
        [[UIImage imageNamed:@"Background final640_940.png"] drawInRect:self.view.bounds];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    
        self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    [self.navigationController.navigationBar setTranslucent:NO];
    // Do any additional setup after loading the view.
}

- (IBAction)validate1:(id)sender {
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)validateEmail:(NSString*)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}
- (IBAction)doctorRegister:(id)sender {
    DoctorRegistrer *doc =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorRegistrer"];
    [self.navigationController pushViewController:doc animated:YES];

}

- (IBAction)patientRegister:(id)sender {
    PatientRegisterViewController *doc =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientRegisterViewController"];
    [self.navigationController pushViewController:doc animated:YES];
    

}

- (IBAction)assistantRegister:(id)sender {
    AssistantRegister *doc =
    [self.storyboard instantiateViewControllerWithIdentifier:@"AssistantRegister"];
    [self.navigationController pushViewController:doc animated:YES];
    

}

- (IBAction)aboutMedico:(id)sender {
    AboutMedicoViewController *doc =
    [self.storyboard instantiateViewControllerWithIdentifier:@"AboutMedicoViewController"];
    [self.navigationController pushViewController:doc animated:YES];
    

}

- (IBAction)validate:(id)sender {
    [self.view setUserInteractionEnabled:NO];
    [self.passwordField resignFirstResponder];
    [self.emailField resignFirstResponder];
    
    //[self.view endEditing:YES];
    
    BOOL isEmailValid = [self validateEmail:emailField.text];
    if ([emailField.text isEqualToString:@""] || [passwordField.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!"
                                                        message:@"Both fields are Mandatory."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [self.view setUserInteractionEnabled:YES];
    } else{
        if (isEmailValid) {
            BOOL isConnected = [self checkInternetConnection];
            if (isConnected) {
                [self loginRequest];
            } else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                                message:@"Please try once you are connected to Internet."
                                                               delegate:self
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
                emailField.text = @"";
                passwordField.text = @"";
                [self.view setUserInteractionEnabled:YES];
                
            }
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!"
                                                            message:@"Please Enter Valid Email Address."
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [self.view setUserInteractionEnabled:YES];
        }
        
    }
    
}

- (IBAction)forgotPassword:(id)sender {
    ForgotPasswordView *doc =
    [self.storyboard instantiateViewControllerWithIdentifier:@"ForgotPasswordView"];
    [self.navigationController pushViewController:doc animated:YES];
    

}

-(void)errorMessage{
    [spinner stopAnimating];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                    message:@"An error occured. Please try again later."
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    emailField.text = @"";
    passwordField.text = @"";
    [self.view setUserInteractionEnabled:YES];
    
}
-(void)requestTimeOut{
    [spinner stopAnimating];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                    message:@"An error occured. Server is not responding!"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    emailField.text = @"";
    passwordField.text = @"";
    [self.view setUserInteractionEnabled:YES];
    
}
-(NSString *)getDoctorName{
    NSLog(@"GetName Method is called....");
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSString *emailid = emailField.text;
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/getProfileDoctor?email=%@",emailid];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"Data in Array==============%@",arratList);
    NSLog(@"name of doctor=====%@",[arratList valueForKey:@"name"]);
    
    NSString *nameOfDoctor = [arratList valueForKey:@"name"];
    nameOfDoctor = [nameOfDoctor capitalizedString];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:emailField.text forKey:@"loggedInEmail"];
    [ud setObject:@"Doctor" forKey:@"loggedInUserType"];
    [ud setObject:nameOfDoctor forKey:@"loggedInDoctor"];
    [ud setObject:@"" forKey:@"loggedInPatient"];
    [ud synchronize];
    return nameOfDoctor;
    
    
}

-(NSString *)getPatientName{
    NSLog(@"GetName Method is called....");
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSString *emailid = emailField.text;
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/getProfilePatient?email=%@",emailid];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"Data in Array==============%@",arratList);
    NSLog(@"name of doctor=====%@",[arratList valueForKey:@"name"]);
    
    NSString *nameOfPatient = [arratList valueForKey:@"name"];
    nameOfPatient = [nameOfPatient capitalizedString];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:emailField.text forKey:@"loggedInEmail"];
    [ud setObject:@"Patient" forKey:@"loggedInUserType"];
    [ud setObject:@"" forKey:@"loggedInDoctor"];
    [ud setObject:nameOfPatient forKey:@"loggedInPatient"];
    [ud synchronize];
    return nameOfPatient;
    
}



-(void)loginRequest{
    //    [self.view endEditing:YES];
    returnString = @"";
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL * url = [NSURL URLWithString:@"http://139.162.31.36:9000/login"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    NSString * params =[NSString stringWithFormat:@"\{\"emailID\":\"%@\",\"password\":\"%@\"}",emailField.text,passwordField.text];
    NSLog(@"%@",params);
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



-(BOOL)checkInternetConnection{
    //        [self.view endEditing:YES];
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
    NSURL *scriptUrl = [NSURL URLWithString:@"http://www.msftncsi.com/ncsi.txt"];
    NSData *data = [NSData dataWithContentsOfURL:scriptUrl];
    if (data){
        NSLog(@"Device is connected to the internet");
        //[spinner stopAnimating];
        return 1;
    } else{
        [spinner stopAnimating];
        NSLog(@"Device is not connected to the internet");
        return 0;
    }
}

-(void)threadStartAnimating:(id)data
{
    [spinner startAnimating];
    [self.view setUserInteractionEnabled:NO];
    
}
-(void)viewDidDisappear:(BOOL)animated{
    self.loginButton.enabled = YES;
}


-(void)parseJSON : (NSString *)responseData{
    NSString * jsonString = responseData;
    //NSStringEncoding  encoding;
    NSData * jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError * error=nil;
    NSDictionary * parsedData = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    NSLog(@"NSDictionery:%@",parsedData);
    NSString *userType = [NSString stringWithFormat:[parsedData valueForKey:@"type"]];
    NSLog(@"userType:%@",[parsedData valueForKey:@"type"]);
    //NSString *email = [NSString stringWithFormat:[parsedData valueForKey:@"emailID"]];
    if ([userType isEqualToString:@"Doctor"]) {
        DoctorLandingPageView *doctorHome =
        [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
        doctorHome.doctorEmail = [NSString stringWithFormat:emailField.text];
        NSLog(@"email passing %@",doctorHome.doctorEmail);
        NSString *drName = [self getDoctorName];
        doctorHome.doctorName = drName;
        NSLog(@"Return block doctor name:========%@",drName);
        [self.navigationController pushViewController:doctorHome animated:YES];
        [spinner stopAnimating];
    }
    else if ([userType isEqualToString:@"Patient"]){
        //        DoctorLandingPageView *doctorHome =
        //        [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
        //        doctorHome.doctorEmail = [NSString stringWithFormat:emailField.text];
        //        NSLog(@"email passing %@",doctorHome.doctorEmail);
        //        NSString *pName = [self getPatientName];
        //        doctorHome.doctorName = pName;
        //        NSLog(@"Return block doctor name:========%@",pName);
        //        [self.navigationController pushViewController:doctorHome animated:YES];
        [spinner stopAnimating];
        //As Patient Page not not present, doctor page is displayed
        PatientLandingPageViewController *patientHome =
        [self.storyboard instantiateViewControllerWithIdentifier:@"PatientLandingPageViewController"];
        [self.navigationController pushViewController:patientHome animated:YES];
    }
    //    else {
    //        AssistantLandingPageView *assistantHome =
    //        [self.storyboard instantiateViewControllerWithIdentifier:@"AssistantHome"];
    //        [self.navigationController pushViewController:assistantHome animated:YES];
    //    }
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
}



@end
