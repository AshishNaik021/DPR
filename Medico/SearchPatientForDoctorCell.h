//
//  SearchPatientForDoctorCell.h
//  Medico
//
//  Created by APPLE on 21/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchPatientForDoctorCell : UITableViewCell
@property IBOutlet UILabel *nameLabel;
@property IBOutlet UILabel *locationlabel;
@property IBOutlet UIImageView *patientImage;
@property IBOutlet UIButton *patientDetailButton;
@property IBOutlet UIButton *showAppointmentButton;

-(IBAction)patientDetail:(id)sender;
-(IBAction)showAppointment:(id)sender;

@end
