//
//  DoctorBookAppointmentViewController.h
//  Medico
//
//  Created by APPLE on 24/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorBookAppointmentViewController : UIViewController

- (IBAction)timeClicked1:(id)sender;
- (IBAction)timeClicked2:(id)sender;
- (IBAction)timeClicked3:(id)sender;
- (IBAction)timeClicked4:(id)sender;
- (IBAction)timeClicked5:(id)sender;
- (IBAction)timeClicked6:(id)sender;
- (IBAction)timeClicked7:(id)sender;
- (IBAction)timeClicked8:(id)sender;
- (IBAction)timeClicked9:(id)sender;
- (IBAction)timeClicked10:(id)sender;
- (IBAction)timeClicked11:(id)sender;
- (IBAction)timeClicked12:(id)sender;
- (IBAction)timeClicked13:(id)sender;
- (IBAction)timeClicked14:(id)sender;
- (IBAction)timeClicked15:(id)sender;
- (IBAction)timeClicked16:(id)sender;
- (IBAction)timeClicked17:(id)sender;
- (IBAction)timeClicked18:(id)sender;
- (IBAction)doneButtonClicked:(id)sender;


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
@property (weak, nonatomic) IBOutlet UIButton *time1;
@property (weak, nonatomic) IBOutlet UIButton *time2;
@property (weak, nonatomic) IBOutlet UIButton *time3;
@property (weak, nonatomic) IBOutlet UIButton *time4;
@property (weak, nonatomic) IBOutlet UIButton *time5;
@property (weak, nonatomic) IBOutlet UIButton *time6;
@property (weak, nonatomic) IBOutlet UIButton *time7;
@property (weak, nonatomic) IBOutlet UIButton *time8;
@property (weak, nonatomic) IBOutlet UIButton *time9;
@property (weak, nonatomic) IBOutlet UIButton *time10;
@property (weak, nonatomic) IBOutlet UIButton *time11;
@property (weak, nonatomic) IBOutlet UIButton *time12;
@property (weak, nonatomic) IBOutlet UIButton *time13;
@property (weak, nonatomic) IBOutlet UIButton *time14;
@property (weak, nonatomic) IBOutlet UIButton *time15;
@property (weak, nonatomic) IBOutlet UIButton *time16;
@property (weak, nonatomic) IBOutlet UIButton *time17;
@property (weak, nonatomic) IBOutlet UIButton *time18;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@end
