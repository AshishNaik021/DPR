//
//  DetailPatientProfileViewController.h
//  Medico
//
//  Created by APPLE on 10/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailPatientProfileViewController : UIViewController

@property IBOutlet NSArray *detailArr;

@property (weak, nonatomic) IBOutlet UIImageView *patientPicture;
@property (weak, nonatomic) IBOutlet UILabel *patientNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *patientSpecialityField;
@property (weak, nonatomic) IBOutlet UILabel *lastVisitedField;
@property (weak, nonatomic) IBOutlet UIView *profileContainerView;
@property (weak, nonatomic) IBOutlet UIView *appointmentContainerView;
@property (weak, nonatomic) IBOutlet UIButton *appointmentTabButton;
@property (weak, nonatomic) IBOutlet UIButton *profileTabButton;

- (IBAction)profileTab:(id)sender;

- (IBAction)appointmentTab:(id)sender;


-(IBAction)homePage:(id)sender;

@end
