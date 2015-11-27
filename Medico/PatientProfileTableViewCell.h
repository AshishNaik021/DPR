//
//  PatientProfileTableViewCell.h
//  Medico
//
//  Created by APPLE on 09/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientProfileTableViewCell : UITableViewCell

@property IBOutlet UILabel *patientNameLabel;
@property IBOutlet UIImageView *patientPicture;
@property (weak, nonatomic) IBOutlet UIButton *lastVisitedButton;
- (IBAction)lastVisited:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *lastAppointmentButton;
- (IBAction)lastAppointment:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *appointmentButton;
- (IBAction)appointment:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *showPatientProfileButton;
- (IBAction)showPatientProfile:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *getAllAppointmentButton;
- (IBAction)getAllAppointmnet:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *nextAppointmentButton;
- (IBAction)nextAppointment:(id)sender;



@end
