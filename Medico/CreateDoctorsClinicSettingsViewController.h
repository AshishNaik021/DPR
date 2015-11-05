//
//  CreateDoctorsClinicSettingsViewController.h
//  Medico
//
//  Created by APPLE on 15/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateDoctorsClinicSettingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *createClinicNameField;
@property (weak, nonatomic) IBOutlet UITextField *createEmailField;
@property (weak, nonatomic) IBOutlet UITextField *createMobileField;
@property (weak, nonatomic) IBOutlet UITextField *createLandLineField;

@property (weak, nonatomic) IBOutlet UITextView *createLocationTextView;
@property (weak, nonatomic) IBOutlet UIButton *createClinicButton;
- (IBAction)createClinic:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *createSlotTextView;
@property (weak, nonatomic) IBOutlet UIButton *alwaysButton;
@property (weak, nonatomic) IBOutlet UIButton *exceptCurrentSlotButton;
@property (weak, nonatomic) IBOutlet UIButton *exceptCurrentDayButton;
@property (weak, nonatomic) IBOutlet UIButton *confirmByDoctorButton;
- (IBAction)always:(id)sender;
- (IBAction)exceptCurrentSlot:(id)sender;
- (IBAction)exceptCurrentDay:(id)sender;
- (IBAction)confirmByDoctor:(id)sender;


@end
