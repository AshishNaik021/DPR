//
//  SMSConfirmationView.m
//  Medico
//
//  Created by APPLE on 07/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "SMSConfirmationView.h"
#import "LoginPage.h"

@interface SMSConfirmationView ()

@end


@implementation SMSConfirmationView

@synthesize data = _data;
@synthesize smsRegistrationCodeField;
@synthesize emailRegistrationCodeField;
@synthesize smsResendButton;
@synthesize emailResendButton;
@synthesize registrationConfirmedButton;
@synthesize registrationCode;
@synthesize returnString;

- (void)viewDidLoad {
    NSLog(@"SMSConfirmationView.m");
    spinner = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(150, 225, 20, 30)];
    [spinner setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    spinner.color = [UIColor blueColor];
    spinner.center=self.view.center;
    [self.view addSubview:spinner];
    self.navigationItem.title = @"Registration";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    // self.navigationController.navigationBar.backgroundColor = [UIColor cyanColor];//[UIColor colorWithRed:120 green:211 blue:199 alpha:1.0];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    
    
    registrationCode = @"";
    [super viewDidLoad];
    NSLog(@"Data dic: %@",_data);
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:_data
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"jsonstring %@",jsonString);
    }
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

-(void) errorMessageEnterCode{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter Registration Code." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(void)errorMessageDifferentCode{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter Unique Registration Code." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(void)errorMesasgeWrongCode{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Registration Code." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
- (IBAction)smsResend:(id)sender {
}
- (IBAction)emailResend:(id)sender {
}
-(void)redirect{
    LoginPage *confirmationView =
    [self.storyboard instantiateViewControllerWithIdentifier:@"LoginPage"];
    [self.navigationController pushViewController:confirmationView animated:YES];
}
- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 200 || alertView.tag == 201){
        [self redirect];
    }
}
-(void)parseJSON : (NSString *)responseData{
    NSString * jsonString = responseData;
    NSLog(@"responseData %@",responseData);
    NSLog(@"jsonString %@",jsonString);
    if ([jsonString intValue]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Successful!" message:@"Successfully Registered." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        alert.tag = 200;
        [spinner stopAnimating];
        [alert show];
    }
    else{
        //NSStringEncoding  encoding;
        NSData * jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSError * error=nil;
        NSDictionary * parsedData = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
        NSLog(@"NSDictionery:%@",parsedData);
        NSString *message = [NSString stringWithFormat:[parsedData valueForKey:@"message"]];
        //NSLog(@"userType:%@",[parsedData valueForKey:@"type"]);
        if ([message isEqualToString:@"User Already Exist!"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!"
                                                            message:@"User already exists. Please try to Login!"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [spinner stopAnimating];
            alert.tag = 201;
            [alert show];
            
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
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
}
-(void)registerDoctor{
    //returnString = @"";
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL * url = [NSURL URLWithString:@"http://139.162.31.36:9000/registerDoctor"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    //NSString * params =[NSString stringWithFormat:@"\{\"bloodGroup\":%@,\"cloudLoginId\":%@,\"cloudLoginPassword\":%@,\"cloudType\":%@,\"dateOfBirth\":\"%@\",\"emailID\":\"%@\",\"gender\":\"%@\",\"location\":\"%@\",\"mobileNumber\":\"%@\",\"name\":\"%@\",\"password\":\"%@\",\"speciality\":\"%@\"\}",[_data objectForKey:@"bloodGroup"],[_data objectForKey:@"cloudLoginId"],[_data objectForKey:@"cloudLoginPassword"],[_data objectForKey:@"cloudType"],[_data objectForKey:@"dateOfBirth"],[_data objectForKey:@"emailID"],[_data objectForKey:@"gender"],[_data objectForKey:@"location"],[_data objectForKey:@"mobileNumber"],[_data objectForKey:@"name"],[_data objectForKey:@"password"],[_data objectForKey:@"speciality"]];
    
    // imp  working copy=================================
    
    //NSString * params =[NSString stringWithFormat:@"\{\"bloodGroup\":\"A+\",\"cloudLoginId\":\"\",\"cloudLoginPassword\":\"\",\"cloudType\":\"3\",\"dateOfBirth\":\"2015-9-22\",\"emailID\":\"%@\",\"gender\":\"Male\",\"location\":\"pune\",\"mobileNumber\":\"+911234567890\",\"name\":\"rajiv\",\"password\":\"rajiv\",\"speciality\":\"pediatric\"}",[_data objectForKey:@"emailID"]];
    
    NSString * params =[NSString stringWithFormat:@"\{\"bloodGroup\":\"%@\",\"cloudLoginId\":\"\",\"cloudLoginPassword\":\"\",\"cloudType\":\"3\",\"dateOfBirth\":\"%@\",\"emailID\":\"%@\",\"gender\":\"%@\",\"location\":\"%@\",\"mobileNumber\":\"%@\",\"name\":\"%@\",\"password\":\"%@\",\"speciality\":\"%@\"}",[_data objectForKey:@"bloodGroup"],[_data objectForKey:@"dateOfBirth"],[_data objectForKey:@"emailID"],[_data objectForKey:@"gender"],[_data objectForKey:@"location"],[_data objectForKey:@"mobileNumber"],[_data objectForKey:@"name"],[_data objectForKey:@"password"],[_data objectForKey:@"speciality"]];
    
    NSLog(@"params %@",params);
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
                                                                   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                                                                                   message:@"An error occured. Please try again later."
                                                                                                                  delegate:self
                                                                                                         cancelButtonTitle:@"OK"
                                                                                                         otherButtonTitles:nil];
                                                                   [spinner stopAnimating];
                                                                   [alert show];
                                                                   
                                                               }
                                                           }
                                                           else{
                                                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                                                                               message:@"An error occured. Please try again later."
                                                                                                              delegate:self
                                                                                                     cancelButtonTitle:@"OK"
                                                                                                     otherButtonTitles:nil];
                                                               [spinner stopAnimating];
                                                               [alert show];
                                                           }
                                                           
                                                       }];
    [dataTask resume];
    
}
-(void)verify:(NSString *)regCode{
    if ([registrationCode isEqualToString:@"1234"]) {
        [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
        [self registerDoctor];
    }
    else{
        [self errorMesasgeWrongCode];
    }
    
    
    
    //verfify reg code here.
    
    //    NSMutableURLRequest *request =
    //    [NSMutableURLRequest requestWithURL:[NSURL
    //                                         URLWithString:@"http://139.162.31.36:9000/getVerificationCode"]
    //                            cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
    //                        timeoutInterval:10
    //     ];
    //
    //    [request setHTTPMethod: @"GET"];
    //
    //    NSError *requestError = nil;
    //    NSURLResponse *urlResponse = nil;
    //
    //
    //    NSData *response1 =
    //    [NSURLConnection sendSynchronousRequest:request
    //                          returningResponse:&urlResponse error:&requestError];
}
-(void)threadStartAnimating:(id)data
{
    [spinner startAnimating];
}
- (IBAction)registrationConfirmed:(id)sender {
    if(![smsRegistrationCodeField.text isEqualToString:@""] && ![emailRegistrationCodeField.text isEqualToString:@""]){
        if ([smsRegistrationCodeField.text isEqualToString:emailRegistrationCodeField.text]) {
            registrationCode = [NSString stringWithFormat:smsRegistrationCodeField.text];
            [self verify:registrationCode];
        }
        else{
            [self errorMessageDifferentCode];
        }
        
    }
    else if ([smsRegistrationCodeField.text isEqualToString:@""] && [emailRegistrationCodeField.text isEqualToString:@""]) {
        [self errorMessageEnterCode];
    }
    else if (![smsRegistrationCodeField.text isEqualToString:@""] && [emailRegistrationCodeField.text isEqualToString:@""]){
        registrationCode = [NSString stringWithFormat:smsRegistrationCodeField.text];
        [self verify:registrationCode];
    }
    else if ([smsRegistrationCodeField.text isEqualToString:@""] && ![emailRegistrationCodeField.text isEqualToString:@""]){
        registrationCode = [NSString stringWithFormat:emailRegistrationCodeField.text];
        [self verify:registrationCode];
    }
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField.returnKeyType==UIReturnKeyNext) {
        UIView *next = [[textField superview] viewWithTag:textField.tag+1];
        [next becomeFirstResponder];
        [textField resignFirstResponder];
    }else if (textField.returnKeyType==UIReturnKeyDone) {
        [textField resignFirstResponder];
    }
    
    return YES;
}
@end