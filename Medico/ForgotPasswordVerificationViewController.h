//
//  ForgotPasswordVerificationViewController.h
//  Medico
//
//  Created by APPLE on 15/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotPasswordVerificationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *confirmCodeField;
@property (weak, nonatomic) IBOutlet UIButton *confirmCodeButton;
- (IBAction)confirmCode:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *resendCodeButton;
- (IBAction)resendCode:(id)sender;




@end
