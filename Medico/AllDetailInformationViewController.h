//
//  AllDetailInformationViewController.h
//  Medico
//
//  Created by APPLE on 26/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllDetailInformationViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource,UITableViewDataSource,UITableViewDelegate>{
}
@property IBOutlet NSMutableArray *array;
@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@property (weak, nonatomic) IBOutlet UIButton *summaryTagButton;
@property (weak, nonatomic) IBOutlet UIButton *documentTagButton;
@property (weak, nonatomic) IBOutlet UIButton *doctorsNoteTagButton;
@property (weak, nonatomic) IBOutlet UIButton *treatmentPlanTagButton;
@property (weak, nonatomic) IBOutlet UIButton *invoicesTagButton;
@property (weak, nonatomic) IBOutlet UITableView *summaryMedicinTableView;

@property (weak, nonatomic) IBOutlet UIView *summaryContentView;
@property (weak, nonatomic) IBOutlet UIView *documentContentView;
@property (weak, nonatomic) IBOutlet UIView *doctorsNoteContentView;
@property (weak, nonatomic) IBOutlet UIView *treatmentPlanContentView;
@property (weak, nonatomic) IBOutlet UIView *invoiceContentView;

@property (weak, nonatomic) IBOutlet UITextField *summaryClinicNameField;
@property (weak, nonatomic) IBOutlet UITextField *summaryVisiteDateField;
@property (weak, nonatomic) IBOutlet UITextField *summaryVisiteTypeField;
@property (weak, nonatomic) IBOutlet UITextField *summaryReferredbyField;
@property (weak, nonatomic) IBOutlet UITextView *summarySymptomsTextView;
@property (weak, nonatomic) IBOutlet UITextView *summaryDiagnosisTextview;
@property (weak, nonatomic) IBOutlet UITextView *summaryMedicineTextView;
@property (weak, nonatomic) IBOutlet UITextView *summaryTestPrescribedTextView;

@property (weak, nonatomic) IBOutlet UIButton *summarySymptomsHistoryButton;
@property (weak, nonatomic) IBOutlet UIButton *summaryDiagnosisHistoryButton;
@property (weak, nonatomic) IBOutlet UIButton *summaryMedicineHistoryButton;
@property (weak, nonatomic) IBOutlet UIButton *summaryTestPrescribedHistoryButton;
@property (weak, nonatomic) IBOutlet UIButton *summarySaveButton;

@property (weak, nonatomic) IBOutlet UITextView *doctorsNoteSymptomsTextView;
@property (weak, nonatomic) IBOutlet UITextView *doctorsNoteDiagnosisTextView;
@property (weak, nonatomic) IBOutlet UITextView *doctorsNoteNoteTextView;
@property (weak, nonatomic) IBOutlet UIButton *doctorsNoteSaveButton;




- (IBAction)summary:(id)sender;
- (IBAction)documents:(id)sender;
- (IBAction)doctorsNote:(id)sender;
- (IBAction)treatmentPlan:(id)sender;
- (IBAction)invoices:(id)sender;
- (IBAction)summarySymptomsHistory:(id)sender;
- (IBAction)summaryDiagnosisHistory:(id)sender;
- (IBAction)summaryMedicineHistory:(id)sender;
- (IBAction)summaryTestPrescribedHistory:(id)sender;
- (IBAction)summarySave:(id)sender;
- (IBAction)doctorsNoteSave:(id)sender;

@property IBOutlet NSString *summaryDatePassData;
@property IBOutlet NSString *summaryTimePassData;
@property IBOutlet NSString *summaryPatientEmailPassData;
@property IBOutlet NSString *summaryDoctorIDPassData;






@end
