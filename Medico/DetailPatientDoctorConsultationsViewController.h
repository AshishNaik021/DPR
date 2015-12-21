//
//  DetailPatientDoctorConsultationsViewController.h
//  Medico
//
//  Created by Apple on 24/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailPatientDoctorConsultationsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *doctorProfileImage;
@property (weak, nonatomic) IBOutlet UIButton *hideDetailsButton;
@property (weak, nonatomic) IBOutlet UILabel *doctorNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *doctorSpecialtyLabel;
@property (weak, nonatomic) IBOutlet UIButton *lastVisitedButton;
@property (weak, nonatomic) IBOutlet UIButton *lastAppointmentButton;
@property (weak, nonatomic) IBOutlet UIButton *nextAppointmentButton;
@property (weak, nonatomic) IBOutlet UIButton *goNextDetailButton;
@property (weak, nonatomic) IBOutlet UIButton *profileButton;
@property (weak, nonatomic) IBOutlet UIButton *clinicsButton;

@property (weak, nonatomic) IBOutlet UIView *profileContentView;
@property (weak, nonatomic) IBOutlet UIView *clinicsContentView;
@property (weak, nonatomic) IBOutlet UIView *bookOnlineAppointContentView;

@property (weak, nonatomic) IBOutlet UITextField *profileEmailIdField;
@property (weak, nonatomic) IBOutlet UITextField *profileMobileField;
@property (weak, nonatomic) IBOutlet UITextField *profileGenderField;
@property (weak, nonatomic) IBOutlet UITextField *profileDateOfBirthField;
@property (weak, nonatomic) IBOutlet UITextField *profileLocationField;
@property (weak, nonatomic) IBOutlet UITextField *profilePracticeNameField;
@property (weak, nonatomic) IBOutlet UITextView *profileSpecializationField;
@property (weak, nonatomic) IBOutlet UILabel *bookOnlineAppointShiftTimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *bookOnlineAppointBookAppointmentButton;
- (IBAction)bookOnlineAppointBookAppointment:(id)sender;

@property IBOutlet NSString *value;
@property (weak, nonatomic) IBOutlet UILabel *bookOnlineAppointClinicNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *bookOnlineAppointVisiteTypeField;


@property (retain, nonatomic)  UIPickerView *picker;
@property (nonatomic,retain) NSArray *pickerVisiteTypeArr;


- (IBAction)hideDetails:(id)sender;
- (IBAction)lastVisited:(id)sender;
- (IBAction)lastAppointment:(id)sender;
- (IBAction)nextAppointment:(id)sender;
- (IBAction)goNextDetail:(id)sender;
- (IBAction)profile:(id)sender;
- (IBAction)clinics:(id)sender;

@end
