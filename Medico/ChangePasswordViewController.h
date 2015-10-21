//
//  ChangePasswordViewController.h
//  Medico
//
//  Created by APPLE on 13/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePasswordViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UITextField *oldPasswordField;
@property (weak, nonatomic) IBOutlet UITextField *writeNewPasswordField;
@property (weak, nonatomic) IBOutlet UITextField *reEnterPasswordField;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
- (IBAction)confirm:(id)sender;


@end

