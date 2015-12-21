//
//  PatientUploadPDFDocumentViewController.h
//  Medico
//
//  Created by Apple on 26/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientUploadPDFDocumentViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *dateField;
@property (weak, nonatomic) IBOutlet UIButton *calendarButton;
- (IBAction)calendar:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *doctorConsultationButton;
- (IBAction)doctorConsultation:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *doctorConsultationNameField;
@property (weak, nonatomic) IBOutlet UIButton *addDoctorConsultationButton;
- (IBAction)addDoctorConsultation:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *labReportRadioButton;
- (IBAction)labReportRadio:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *referredByField;
@property (weak, nonatomic) IBOutlet UIButton *addLabReportButton;
- (IBAction)addLabReport:(id)sender;





@end
