//
//  PatientClinicProfileAndAppointmentsViewController.h
//  Medico
//
//  Created by APPLE on 16/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientClinicProfileAndAppointmentsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *clinicImage;
@property (weak, nonatomic) IBOutlet UILabel *clinicNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *clinicSpecializationLabel;
@property (weak, nonatomic) IBOutlet UIButton *nextAppointmentButton;
- (IBAction)nextAppointment:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *profileView;
@property (weak, nonatomic) IBOutlet UIView *appointmentView;
@property (weak, nonatomic) IBOutlet UIButton *profileButton;
- (IBAction)profileClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *appointmentButton;
- (IBAction)appointmentClicked:(id)sender;




@end
