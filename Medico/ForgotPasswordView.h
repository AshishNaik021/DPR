//
//  ForgotPasswordView.h
//  Medico
//
//  Created by APPLE on 07/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotPasswordView : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *emailField;

@property (weak, nonatomic) IBOutlet UIButton *sendButton;

- (IBAction)sendPassword:(id)sender;






@end
