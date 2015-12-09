//
//  PatientManageAppointmentCell.h
//  Medico
//
//  Created by Apple on 09/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientManageAppointmentCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *clinicImage;
@property (weak, nonatomic) IBOutlet UIButton *showDetailsButton;
- (IBAction)showDetails:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *clinicNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *showDocumentsButton;
- (IBAction)showDocuments:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *typeOfClinicLabel;
@property (weak, nonatomic) IBOutlet UIImageView *watchImage;
@property (weak, nonatomic) IBOutlet UIButton *alarmOnOffButton;
- (IBAction)alarmOnOff:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *appointmentTypeLabel;
@property (weak, nonatomic) IBOutlet UIButton *appointmentDateButton;
- (IBAction)appointmentDate:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *appointmentTimeButton;
- (IBAction)appointmentTime:(id)sender;




@end
