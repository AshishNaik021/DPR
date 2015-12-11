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
@synthesize  keyboardVisible;
@synthesize offset;
@synthesize height;
@synthesize width;
@synthesize screen;
@synthesize scrollHeight;
@synthesize scroll;

- (void)viewDidLoad {
    NSLog(@"ChangePasswordViewController.m");
    [super viewDidLoad];
   // self.navigationItem.title = @"Change Password";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    keyboardVisible = NO;
    screen = [[UIScreen mainScreen] bounds];
    width = CGRectGetWidth(screen);
    //Bonus height.
    height = CGRectGetHeight(screen);
    scrollHeight = height + 200;
    NSLog(@"Width is--- %f",width);
    NSLog(@"Height is--- %f",height);
    [scroll setScrollEnabled:YES];
    [scroll setContentSize:CGSizeMake(width, scrollHeight)];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background final640_940.png"]];
    self.view.backgroundColor = [UIColor clearColor];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"Background final640_940.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    [self.navigationController.navigationBar setTranslucent:NO];

    
    // Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"Registering for keyboard events");
    
    // Register for the events
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidShow:)
                                                 name: UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidHide:)
                                                 name: UIKeyboardDidHideNotification object:nil];
    
    //Initially the keyboard is hidden
    keyboardVisible = NO;
}

-(void) viewWillDisappear:(BOOL)animated
{
    NSLog (@"Unregister for keyboard events");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void) keyboardDidShow: (NSNotification *)notif
{
    // If keyboard is visible, return
    if (keyboardVisible)
    {
        NSLog(@"Keyboard is already visible. Ignore notification.");
        return;
    }
    
    // Get the size of the keyboard.
    NSDictionary* info = [notif userInfo];
    NSValue* aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];
    CGSize keyboardSize = [aValue CGRectValue].size;
    
    // Save the current location so we can restore
    // when keyboard is dismissed
    offset = self.scroll.contentOffset;
    
    // Resize the scroll view to make room for the keyboard
    CGRect viewFrame = scroll.frame;
    viewFrame.size.height -= keyboardSize.height;
    scroll.frame = viewFrame;
    
    // Keyboard is now visible
    keyboardVisible = YES;
}

-(void) keyboardDidHide: (NSNotification *)notif
{
    // Is the keyboard already shown
    if (!keyboardVisible)
    {
        NSLog(@"Keyboard is already hidden. Ignore notification.");
        return;
    }
    
    // Reset the frame scroll view to its original value
    scroll.frame = CGRectMake(0, 0, width, scrollHeight);
    
    // Reset the scrollview to previous location
    scroll.contentOffset = offset;
    
    // Keyboard is no longer visible
    keyboardVisible = NO;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField.returnKeyType==UIReturnKeyNext) {
        UIView *next = [[textField superview] viewWithTag:textField.tag+1];
        [next becomeFirstResponder];
        //[textField resignFirstResponder];
    }else if (textField.returnKeyType==UIReturnKeyDone) {
        [textField resignFirstResponder];
    }
    
    return YES;
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

