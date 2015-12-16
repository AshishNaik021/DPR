//
//  DoctorAddTemplateSettingViewController.h
//  Medico
//
//  Created by Apple on 16/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorAddTemplateSettingViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *templateNameField;
@property (weak, nonatomic) IBOutlet UIButton *addTemplateButton;
- (IBAction)addTemplate:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
- (IBAction)cancel:(id)sender;

@end
