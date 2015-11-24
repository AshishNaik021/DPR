//
//  PatientLandingPageViewController.h
//  Medico
//
//  Created by APPLE on 15/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientLandingPageViewController : UIViewController

@property IBOutlet NSArray *image;
@property IBOutlet NSArray *titleName;
@property IBOutlet NSArray *total;
@property (weak, nonatomic) IBOutlet UILabel *pNameLabel;
@property (nonatomic, retain) NSString * patientName;
@property (nonatomic, retain) NSString * patientEmail;

- (IBAction)logout:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;
@property (weak, nonatomic) IBOutlet UIImageView *patientProfileImage;

/*---------------------------------------------*/
@property (weak, nonatomic) IBOutlet UIButton *doctorConsultationsButton;
@property (weak, nonatomic) IBOutlet UIButton *doctorConsultationsTotalButton;
- (IBAction)doctorConsultations:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *diagnosticClinicsLabsButton;
@property (weak, nonatomic) IBOutlet UIButton *diagnosticClinicsLabsTotalButton;

- (IBAction)diagnosticClinicsLabs:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *appointmentButton;
@property (weak, nonatomic) IBOutlet UIButton *appointmentTotalButton;
- (IBAction)appointment:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *reminderButton;
- (IBAction)reminder:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *searchDoctorButton;
- (IBAction)searchDoctor:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *searchClinicButton;
- (IBAction)searchClinic:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *settingButton;
- (IBAction)setting:(id)sender;





















@end