//
//  PatientAllDetailInformationViewController.h
//  Medico
//
//  Created by Apple on 25/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientAllDetailInformationViewController : UIViewController<UITableViewDataSource, UITableViewDelegate,UITextFieldDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

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
@property (weak, nonatomic) IBOutlet UITextField *summarySymptomsTextView;
@property (weak, nonatomic) IBOutlet UITextField *summaryDiagnosisTextView;
@property (weak, nonatomic) IBOutlet UITextField *summaryTestPrescribedTextView;
@property (weak, nonatomic) IBOutlet UIButton *summarySaveButton;
@property (weak, nonatomic) IBOutlet UITableView *summaryTableView;
@property (weak, nonatomic) IBOutlet UITableView *documentTableView;

- (IBAction)summarySave:(id)sender;
- (IBAction)summarySymptoms:(id)sender;
- (IBAction)summaryDiagnosis:(id)sender;
- (IBAction)summaryMedicinePrescribed:(id)sender;
- (IBAction)summaryTestPrescribed:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *summaryAddMedicinePrescribedScheduleButton;
- (IBAction)summaryAddMedicinePrescribedSchedule:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *documentContentView;
@property (weak, nonatomic) IBOutlet UIScrollView *documentScrollView;
@property (weak, nonatomic) IBOutlet UIButton *documentTabButton;
@property (weak, nonatomic) IBOutlet UIButton *documentAddFilesButton;

- (IBAction)documentAddFiles:(id)sender;
@property BOOL *invoiceCheckBool;
@property BOOL *treatmentCheckBool;

@property (weak, nonatomic) IBOutlet UIScrollView *treatmentPlanScrollView;
@property (weak, nonatomic) IBOutlet UIView *treatmentPlanContentView;
@property (weak, nonatomic) IBOutlet UIButton *treatmentPlanTabButton;
@property (weak, nonatomic) IBOutlet UIButton *treatmentCheckButton;
- (IBAction)treatmentCheck:(id)sender;
@property (weak, nonatomic) IBOutlet UICollectionView *treatmentCollectionView;
@property (weak, nonatomic) IBOutlet UIScrollView *treatmentCollectionScrollView;
@property IBOutlet NSMutableArray *array;



@property (weak, nonatomic) IBOutlet UIScrollView *invoiceScrollView;
@property (weak, nonatomic) IBOutlet UIView *invoiceContentView;
@property (weak, nonatomic) IBOutlet UIButton *invoiceTabButton;
@property (weak, nonatomic) IBOutlet UIScrollView *invoiceCollectionScroll;
@property (weak, nonatomic) IBOutlet UICollectionView *invoiceCollectionView;


@property (weak, nonatomic) IBOutlet UIButton *invoiceShareCheckButton;
- (IBAction)invoiceShareCheck:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *invoiceAddButton;
- (IBAction)invoiceAdd:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *invoiceTotalField;
@property (weak, nonatomic) IBOutlet UITextField *invoiceMinusDiscountField;
@property (weak, nonatomic) IBOutlet UITextField *invoiceDiscountField;
@property (weak, nonatomic) IBOutlet UITextField *invoiceAddTaxField;
@property (weak, nonatomic) IBOutlet UITextField *invoiceTaxField;
@property (weak, nonatomic) IBOutlet UITextField *invoiceGrandTotalField;
@property (weak, nonatomic) IBOutlet UITextField *invoiceAdvanceField;
@property (weak, nonatomic) IBOutlet UITextField *invoiceTotalDueField;
@property (weak, nonatomic) IBOutlet UIButton *treatmentAddButton;
- (IBAction)treatmentAdd:(id)sender;



@property (weak, nonatomic) IBOutlet UIScrollView *doctorNoteScrollView;
@property (weak, nonatomic) IBOutlet UIView *doctorNoteContentView;
@property (weak, nonatomic) IBOutlet UIButton *doctorNoteTabButton;




- (IBAction)summaryTab:(id)sender;
- (IBAction)documentTab:(id)sender;
- (IBAction)treatmentPlanTab:(id)sender;
- (IBAction)invoiceTab:(id)sender;
- (IBAction)doctorNoteTab:(id)sender;



@property  BOOL *summarykeyboardVisible;
@property CGPoint summaryoffset;
@property CGFloat summarywidth;
@property CGFloat summaryheight;
@property CGFloat summaryscrollHeight;
@property CGRect summaryscreen;

@property  BOOL *invoicekeyboardVisible;
@property CGPoint invoiceoffset;
@property CGFloat invoicewidth;
@property CGFloat invoiceheight;
@property CGFloat invoicescrollHeight;
@property CGRect invoicescreen;

@end
