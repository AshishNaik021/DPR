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
@property (nonatomic, retain) NSDictionary *data;
@property (weak, nonatomic) IBOutlet UIButton *emailResendButton;
@property (weak, nonatomic) IBOutlet UIButton *registrationConfirmedButton;
@property(nonatomic,retain) NSString * registrationCode;
@property (nonatomic,retain) NSString *returnString;

- (IBAction)registrationConfirmed:(id)sender;
- (IBAction)emailResend:(id)sender;
- (IBAction)smsResend:(id)sender;

@end
