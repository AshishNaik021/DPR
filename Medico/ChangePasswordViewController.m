//
//  ChangePasswordViewController.m
//  Medico
//
//  Created by APPLE on 13/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "ChangePasswordViewController.h"
#import "LoginPage.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController
@synthesize oldPasswordField;
@synthesize writeNewPasswordField;
@synthesize reEnterPasswordField;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Change Password";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
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
-(void)errorMessageOldPasswordNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter Old Password." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(void)errorMessageNewPasswordNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter New Password." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(void)errorMessageRewritePasswordNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please Re-Write Password." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateOldPassword:(NSString *) oldPassword{
    if ([oldPassword isEqualToString:@""]) {
        [self errorMessageOldPasswordNotValid];
        return 0;
    }
    else
        return 1;
}
-(BOOL)validateNewPassword:(NSString *) newPassword{
    if ([newPassword isEqualToString:@""]) {
        [self errorMessageNewPasswordNotValid];
        return 0;
    }
    else
        return 1;
}
-(BOOL)validateReEnterPassword:(NSString *) reEnterPassword{
    if ([reEnterPassword isEqualToString:@""]) {
        [self errorMessageRewritePasswordNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorAllFieldsMandatory{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"All fields are mandatory." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(void)errorMessageBothFieldsNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please Enter All Fields Value." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    
}
-(void)errorDoesNotMatchPassword{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Both Password Should be Same." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (IBAction)confirm:(id)sender {
    if ([oldPasswordField.text isEqualToString:@""]
        && [writeNewPasswordField.text isEqualToString:@""]
        && [reEnterPasswordField.text isEqualToString:@""]) {
        NSLog(@"All Empty");
        [self errorAllFieldsMandatory];
    }
    else if (![self validateOldPassword:oldPasswordField.text] && ![self validateNewPassword:writeNewPasswordField.text] && ![self validateReEnterPassword:reEnterPasswordField.text]){
        [self errorMessageBothFieldsNotValid];
    }
    else if ([writeNewPasswordField.text isEqualToString:reEnterPasswordField.text]){
        
        if ([self validateOldPassword:oldPasswordField.text] && [self validateNewPassword:writeNewPasswordField.text] && [self validateReEnterPassword:reEnterPasswordField.text]){
            //[self errorMessageEmailNotValid];
            NSLog(@"Password Changed.");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Successful!" message:@"Successfuly Changed Password." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            alert.tag = 100;
            [alert show];
//                    LoginPage *forgotPass =
//                    [self.storyboard instantiateViewControllerWithIdentifier:@"LoginPage"];
//                    [self.navigationController pushViewController:forgotPass animated:YES];
        }
    }
    else{
        [self errorDoesNotMatchPassword];
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if ( alertView.tag == 100 ) {
        NSLog(@"Launching the store");
        LoginPage *forgotPass =
                    [self.storyboard instantiateViewControllerWithIdentifier:@"LoginPage"];
        [self.navigationController pushViewController:forgotPass animated:YES];
    }
}


@end

