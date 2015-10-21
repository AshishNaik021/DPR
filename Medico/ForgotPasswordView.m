//
//  ForgotPasswordView.m
//  Medico
//
//  Created by APPLE on 07/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "ForgotPasswordView.h"
#import "ForgotPasswordVerificationViewController.h"

@interface ForgotPasswordView ()

@end

@implementation ForgotPasswordView
@synthesize emailField;
@synthesize sendButton;
@synthesize backgroundImage;
@synthesize mobileNoField;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (BOOL)validatePhone:(NSString *)phoneNumber
{
    NSString *numberRegEx = @"[0-9]{10}";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegEx];
    if ([numberTest evaluateWithObject:phoneNumber] == YES)
        return TRUE;
    else
        return FALSE;
}
-(void)errorMessageEmailNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please Enter Valid Email ID for Password Retrieval." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(void)errorMessageMobileNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please Enter Valid Mobile Number for Password Retrieval." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];

}
-(void)errorMessageBothFieldsNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please Enter Valid Email ID or Valid Mobile Number for Password Retrieval." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
   
}
-(void)errorMessage{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please Enter Email ID or Mobile Number for Password Retrieval." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
- (IBAction)sendPassword:(id)sender {
    if ([emailField.text isEqualToString:@""] && [mobileNoField.text isEqualToString:@""]) {
        [self errorMessage];
    }
    else{
        if (![emailField.text isEqualToString:@""] && ![mobileNoField.text isEqualToString:@""]) {
            if ([self validatePhone:mobileNoField.text] && [self validateEmail:emailField.text]) {
                NSLog(@"Send password on email and mobile");
                
            }
            else if (![self validatePhone:mobileNoField.text] && ![self validateEmail:emailField.text]){
                [self errorMessageBothFieldsNotValid];
            }
            else if (![self validateEmail:emailField.text] && [self validatePhone:mobileNoField.text]){
                //[self errorMessageEmailNotValid];
                NSLog(@"Send SMS");
                ForgotPasswordVerificationViewController *verification =
                [self.storyboard instantiateViewControllerWithIdentifier:@"ForgotPasswordVerificationViewController"];
                [self.navigationController pushViewController:verification animated:YES];
            }
            else if (![self validatePhone:mobileNoField.text] && [self validateEmail:emailField.text]){
                //[self errorMessageMobileNotValid];
                NSLog(@"Send Email");
                ForgotPasswordVerificationViewController *verification =
                [self.storyboard instantiateViewControllerWithIdentifier:@"ForgotPasswordVerificationViewController"];
                [self.navigationController pushViewController:verification animated:YES];
            }
        }
        else {
            if ([emailField.text isEqualToString:@""] && [self validatePhone:mobileNoField.text]) {
                NSLog(@"Send SMS");
                ForgotPasswordVerificationViewController *verification =
                [self.storyboard instantiateViewControllerWithIdentifier:@"ForgotPasswordVerificationViewController"];
                [self.navigationController pushViewController:verification animated:YES];
            }
            else if ([emailField.text isEqualToString:@""] && ![self validatePhone:mobileNoField.text]){
                [self errorMessageMobileNotValid];
            }
            else if ([mobileNoField.text isEqualToString:@""] && [self validateEmail:emailField.text]){
                NSLog(@"Send Email");
                ForgotPasswordVerificationViewController *verification =
                [self.storyboard instantiateViewControllerWithIdentifier:@"ForgotPasswordVerificationViewController"];
                [self.navigationController pushViewController:verification animated:YES];
            }
            else if ([mobileNoField.text isEqualToString:@""] && ![self validateEmail:emailField.text]){
                [self errorMessageEmailNotValid];
            }
        }

    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
//    if(textField.returnKeyType==UIReturnKeyNext) {
//        UIView *next = [[textField superview] viewWithTag:textField.tag+1];
//        [next becomeFirstResponder];
//        //[textField resignFirstResponder];
//    }else if (textField.returnKeyType==UIReturnKeyDone) {
        [textField resignFirstResponder];
   // }
    
    return YES;
    //    [textField resignFirstResponder];
    //    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
