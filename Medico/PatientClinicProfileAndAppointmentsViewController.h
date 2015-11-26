//
//  PatientClinicProfileAndAppointmentsViewController.h
//  Medico
//
//  Created by APPLE on 16/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientClinicProfileAndAppointmentsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *countDocumentButton;
- (IBAction)countDocument:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *clinicImage;
@property (weak, nonatomic) IBOutlet UILabel *clinicNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *clinicSpecializationLabel;
@property (weak, nonatomic) IBOutlet UIButton *nextAppointmentButton;
- (IBAction)nextAppointment:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *profileView;
@property (weak, nonatomic) IBOutlet UIButton *profileButton;
- (IBAction)profileClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *appointmentsButton;
- (IBAction)appointmentClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *appointmentView;
@property (weak, nonatomic) IBOutlet UIButton *hideDetailsButton;
- (IBAction)hideDetails:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *bookAppointmentView;
@property (weak, nonatomic) IBOutlet UIScrollView *profileScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *appointmentScrollView;

@property (weak, nonatomic) IBOutlet UITextField *profileNameField;
@property (weak, nonatomic) IBOutlet UITextField *profileEmailField;
@property (weak, nonatomic) IBOutlet UITextField *profileMobileField;
@property (weak, nonatomic) IBOutlet UITextField *profileLandlineField;
@property (weak, nonatomic) IBOutlet UITextField *profileLocationField;
@property (weak, nonatomic) IBOutlet UITextField *profilePracticeField;
@property (weak, nonatomic) IBOutlet UITextView *profileSpecialtyField;
@property (weak, nonatomic) IBOutlet UIButton *bookNowButton;
- (IBAction)bookNow:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *appointmentBookOnlineAMbutton;
- (IBAction)appointmentBookOnlineAM:(id)sender;

/*

@property (weak, nonatomic) IBOutlet UIButton *bookOnlineAMbutton;
@property (weak, nonatomic) IBOutlet UIButton *bookOnlinePMButton;
@property (weak, nonatomic) IBOutlet UIButton *changeNextAppointmentAMButton;
@property (weak, nonatomic) IBOutlet UIButton *changeLaterAppointmentAMButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelNextAMButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelLaterAMButton;
@property (weak, nonatomic) IBOutlet UIButton *changeNextAppointmentPMButton;
@property (weak, nonatomic) IBOutlet UIButton *changeLaterAppointmentPMButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelNextPMButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelLaterPMButton;



- (IBAction)changeNextAppointmentPM:(id)sender;
- (IBAction)changeLaterAppointmentPM:(id)sender;
- (IBAction)cancelNextPM:(id)sender;
- (IBAction)cancelLaterPM:(id)sender;

- (IBAction)bookOnlineAM:(id)sender;
- (IBAction)bookOnlinePM:(id)sender;
- (IBAction)changeNextAppointmentAM:(id)sender;
- (IBAction)changeLaterAppointmentAM:(id)sender;
- (IBAction)cancelNextAM:(id)sender;
- (IBAction)cancelLaterAM:(id)sender;

*/

@end
