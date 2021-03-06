//
//  DoctorLandingPageView.h
//  Medico
//
//  Created by APPLE on 07/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorLandingPageView : UIViewController{
    UIActivityIndicatorView *spinner;
}
@property (weak, nonatomic) IBOutlet UIButton *feedBackButton;
- (IBAction)feedBck:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *doctorNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *settingButton;
- (IBAction)settings:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;
- (IBAction)logout:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *searchAppointmentsButton;
- (IBAction)searchAppointment:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *searchDoctorButton;
- (IBAction)searchDoctor:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *searchClinicButton;
- (IBAction)searchClinic:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *patientProfileButton;
- (IBAction)patientprofile:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *manageFinanceButton;
- (IBAction)manageFinance:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *manageAppointmentButton;
- (IBAction)manageAppointments:(id)sender;
@property (nonatomic, retain) NSString * doctorName;
@property (nonatomic, retain) NSString * doctorEmail;
- (IBAction)searchPatient:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *patientProfileHomeCountButton;
@property (weak, nonatomic) IBOutlet UIButton *manageAppointmentHomeCountButton;
@property (weak, nonatomic) IBOutlet UIButton *manageFinanceHomeCountButton;
@property (weak, nonatomic) IBOutlet UIButton *feedbackHomeCountButton;

@property (weak, nonatomic) IBOutlet UIButton *searchPatientButton;
@property NSArray *homeCountArr;

@end

