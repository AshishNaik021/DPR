//
//  DoctorBookAppointmentViewController.h
//  Medico
//
//  Created by APPLE on 24/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorBookAppointmentViewController : UIViewController

@property IBOutlet NSString *doctorIdPassData;
@property IBOutlet NSString *patientEmailPassData;
@property IBOutlet NSString *appointmentDatePassData;
@property IBOutlet NSString *appointmentTimePassData;
@property (weak, nonatomic) IBOutlet UILabel *appointmentNameLable;
@property (weak, nonatomic) IBOutlet UILabel *lastVisitedDateLabel;
@property (weak, nonatomic) IBOutlet UIButton *nextAppointmentDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *appointmentLabel;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (weak, nonatomic) IBOutlet UITextField *typeTextField;

@end
