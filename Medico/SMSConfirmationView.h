//
//  SMSConfirmationView.h
//  Medico
//
//  Created by APPLE on 07/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMSConfirmationView : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *smsRegistrationCodeField;
@property (weak, nonatomic) IBOutlet UITextField *emailRegistrationCodeField;
@property (weak, nonatomic) IBOutlet UIButton *smsResendButton;

- (IBAction)smsResend:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *emailResendButton;
- (IBAction)emailResend:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *registrationConfirmedButton;
- (IBAction)registrationConfirmed:(id)sender;

@end
