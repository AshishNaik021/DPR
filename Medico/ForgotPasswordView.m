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

@synthesize  keyboardVisible;
@synthesize offset;
@synthesize height;
@synthesize width;
@synthesize screen;
@synthesize scrollHeight;
@synthesize scroll;

- (void)viewDidLoad {
    NSLog(@"ForgotPasswordView.m");
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background final640_940.png"]];
    self.view.backgroundColor = [UIColor clearColor];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"Background final640_940.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    // Do any additional setup after loading the view.
    
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

    
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"Registering for keyboard events");
    [self.navigationController.navigationBar setHidden:YES];
    
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
