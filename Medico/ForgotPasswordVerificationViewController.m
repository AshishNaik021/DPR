//
//  ForgotPasswordVerificationViewController.m
//  Medico
//
//  Created by APPLE on 15/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "ForgotPasswordVerificationViewController.h"
#import "ChangePasswordViewController.h"

@interface ForgotPasswordVerificationViewController ()

@end

@implementation ForgotPasswordVerificationViewController
@synthesize confirmCodeButton;
@synthesize confirmCodeField;
@synthesize resendCodeButton;

- (void)viewDidLoad {
    NSLog(@"ForgotPasswordVerificationViewController.m");
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background final640_940.png"]];
    self.view.backgroundColor = [UIColor clearColor];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"Background final640_940.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  //  self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
   // [self.navigationController.navigationBar setTranslucent:NO];

    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setHidden:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)errorMessage{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please Enter Verification Code." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
- (BOOL)validateCode:(NSString *)verificationCode
{
    NSString *numberRegEx = @"[0-9]{4}";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegEx];
    if ([numberTest evaluateWithObject:verificationCode] == YES)
        return TRUE;
    else
        return FALSE;
}
-(void)errorMessageCodeNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please Enter Correct Verification Code." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField.returnKeyType==UIReturnKeyNext) {
        UIView *next = [[textField superview] viewWithTag:textField.tag+1];
        [next becomeFirstResponder];
       // [textField resignFirstResponder];
    }else if (textField.returnKeyType==UIReturnKeyDone) {
        [textField resignFirstResponder];
    }
    
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)confirmCode:(id)sender {
    if ([confirmCodeField.text isEqualToString:@""]) {
        [self errorMessage];
    }
    else{
    if (![self validateCode:confirmCodeField.text]){
        [self errorMessageCodeNotValid];
    }
    else //if (![self validateCode:confirmCodeField.text])
    {
        NSLog(@"Send Password.");
        ChangePasswordViewController *changePass =
        [self.storyboard instantiateViewControllerWithIdentifier:@"ChangePasswordViewController"];
        [self.navigationController pushViewController:changePass animated:YES];
    }
    }

}
- (IBAction)resendCode:(id)sender {
}

@end
