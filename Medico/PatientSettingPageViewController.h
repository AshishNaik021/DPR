//
//  PatientSettingPageViewController.h
//  Medico
//
//  Created by APPLE on 13/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientSettingPageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *patientPicture;
@property (weak, nonatomic) IBOutlet UILabel *patientNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *manageProfileButton;
- (IBAction)manageProfile:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *termsAndConditionsButton;
- (IBAction)termsAndCondition:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *howItWorksButton;
- (IBAction)howItWorks:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *rateThisAppButton;
- (IBAction)rateThisApp:(id)sender;


@end
