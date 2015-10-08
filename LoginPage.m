//
//  LoginPage.m
//  Medico
//
//  Created by Apple on 02/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "LoginPage.h"
#import "DoctorLandingPageView.h"
//#import "PatientLandingPageView.h"
//#import "AssistantLandingPageView.h"

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
    spinner = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(150, 225, 20, 30)];
    [spinner setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    spinner.color = [UIColor blueColor];
    spinner.center=self.view.center;
    [self.view addSubview:spinner];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//- (IBAction)validate:(id)sender {
//    DoctorLandingPageView *DoctorHome =
//    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
//    [self.navigationController pushViewController:DoctorHome animated:YES];
//
//}
- (BOOL)validateEmail:(NSString*)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}
- (IBAction)validate:(id)sender {
    [self.view endEditing:YES];
    BOOL isEmailValid = [self validateEmail:emailField.text];
    if ([emailField.text isEqualToString:@""] || [passwordField.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!"
                                                        message:@"Both fields are Mandatory."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    } else{
        if (isEmailValid) {
            BOOL isConnected = [self checkInternetConnection];
            if (isConnected) {
                [self loginRequest];
            }
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!"
                                                            message:@"Please Enter Valid Email Address."
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
        
    }
    
}
//-(void)reportError:(long *) statuscode1{
//    NSLog(@"Error Code:%@",statuscode1);
//    [spinner stopAnimating];
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
//                                                    message:@"An error occured. Please try again later."
//                                                   delegate:self
//                                          cancelButtonTitle:@"OK"
//                                          otherButtonTitles:nil];
//    [alert show];
//
//}

-(void)loginRequest{
    
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
                                                                   //[self reportError:[httpResponse statusCode]];
                                                                   [spinner stopAnimating];
                                                                   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                                                                                   message:@"An error occured. Please try again later."
                                                                                                                  delegate:self
                                                                                                         cancelButtonTitle:@"OK"
                                                                                                         otherButtonTitles:nil];
                                                                   [alert show];
                                                                   emailField.text = @"";
                                                                   passwordField.text = @"";
                                                                   
                                                               }
                                                           }
                                                           
                                                       }];
    [dataTask resume];
    
}


-(BOOL)checkInternetConnection{
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
    NSURL *scriptUrl = [NSURL URLWithString:@"http://www.google.com/m"];
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
    if ([userType isEqualToString:@"Doctor"]) {
        DoctorLandingPageView *doctorHome =
        [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
        [self.navigationController pushViewController:doctorHome animated:YES];
        [spinner stopAnimating];
    }
    //    else if ([userType isEqualToString:@"Patient"]){
    //        PatientLandingPageView *patientHome =
    //        [self.storyboard instantiateViewControllerWithIdentifier:@"PatientHome"];
    //        [self.navigationController pushViewController:patientHome animated:YES];
    //    }
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