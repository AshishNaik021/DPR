//
//  PatientAllDetailInformationViewController.h
//  Medico
//
//  Created by Apple on 25/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientAllDetailInformationViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *summaryContentView;
@property (weak, nonatomic) IBOutlet UIScrollView *summaryScrollView;
@property (weak, nonatomic) IBOutlet UIButton *summaryTabButton;
@property (weak, nonatomic) IBOutlet UIButton *summarySymptomsButton;
@property (weak, nonatomic) IBOutlet UIButton *summaryDiagnosisButton;
@property (weak, nonatomic) IBOutlet UIButton *summaryMedicinePrescribedButton;
@property (weak, nonatomic) IBOutlet UIButton *summaryTestPrescribedButton;
@property (weak, nonatomic) IBOutlet UITextField *summaryClinicNameField;
@property (weak, nonatomic) IBOutlet UITextField *summaryVisiteDateField;
@property (weak, nonatomic) IBOutlet UITextField *summaryVisiteTypeField;
@property (weak, nonatomic) IBOutlet UITextField *summaryReferredByField;
@property (weak, nonatomic) IBOutlet UITextView *summarySymptomsTextView;
@property (weak, nonatomic) IBOutlet UITextView *summaryDiagnosisTextView;
@property (weak, nonatomic) IBOutlet UITextView *summaryTestPrescribedTextView;
@property (weak, nonatomic) IBOutlet UIButton *summarySaveButton;
@property (weak, nonatomic) IBOutlet UITableView *summaryTableView;
@property (weak, nonatomic) IBOutlet UITableView *documentTableView;

- (IBAction)summarySave:(id)sender;
- (IBAction)summarySymptoms:(id)sender;
- (IBAction)summaryDiagnosis:(id)sender;
- (IBAction)summaryMedicinePrescribed:(id)sender;
- (IBAction)summaryTestPrescribed:(id)sender;


@property (weak, nonatomic) IBOutlet UIView *documentContentView;
@property (weak, nonatomic) IBOutlet UIScrollView *documentScrollView;
@property (weak, nonatomic) IBOutlet UIButton *documentTabButton;
@property (weak, nonatomic) IBOutlet UIButton *documentAddFilesButton;

- (IBAction)documentAddFiles:(id)sender;


@property (weak, nonatomic) IBOutlet UIScrollView *treatmentPlanScrollView;
@property (weak, nonatomic) IBOutlet UIView *treatmentPlanContentView;
@property (weak, nonatomic) IBOutlet UIButton *treatmentPlanTabButton;




@property (weak, nonatomic) IBOutlet UIScrollView *invoiceScrollView;
@property (weak, nonatomic) IBOutlet UIView *invoiceContentView;
@property (weak, nonatomic) IBOutlet UIButton *invoiceTabButton;




@property (weak, nonatomic) IBOutlet UIScrollView *doctorNoteScrollView;
@property (weak, nonatomic) IBOutlet UIView *doctorNoteContentView;
@property (weak, nonatomic) IBOutlet UIButton *doctorNoteTabButton;




- (IBAction)summaryTab:(id)sender;
- (IBAction)documentTab:(id)sender;
- (IBAction)treatmentPlanTab:(id)sender;
- (IBAction)invoiceTab:(id)sender;
- (IBAction)doctorNoteTab:(id)sender;






@end
