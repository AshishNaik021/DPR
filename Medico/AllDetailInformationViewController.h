//
//  AllDetailInformationViewController.h
//  Medico
//
//  Created by APPLE on 26/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllDetailInformationViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UITextViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>{
    
    IBOutlet UIScrollView *scroll;
    
}
@property (weak, nonatomic) IBOutlet UIPickerView *summaryPicker;
@property IBOutlet NSArray *pickerArr;
@property (weak, nonatomic) IBOutlet UIButton *summaryVisiteTypeButton;
- (IBAction)summaryVisiteType:(id)sender;

@property  BOOL *keyboardVisible;
@property CGPoint offset;
@property CGFloat width;
@property CGFloat height;
@property CGFloat scrollHeight;
@property CGRect screen;
@property  BOOL *keyboardVisibleInvoice;
@property CGPoint offsetInvoice;
@property CGFloat widthInvoice;
@property CGFloat heightInvoice;
@property CGFloat scrollHeightInvoice;
@property CGRect screenInvoice;


@property(nonatomic,retain) IBOutlet NSArray *collectionArray;

@property (weak, nonatomic) IBOutlet UIScrollView *treatmentScrollView;

@property(nonatomic,retain) IBOutlet NSMutableArray *array;
@property(nonatomic,retain) NSMutableArray *arrayo1;
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


@property (weak, nonatomic) IBOutlet UITextField *summarySymptomsTextView;



@property (weak, nonatomic) IBOutlet UITextField *summaryDiagnosisTextview;
@property (weak, nonatomic) IBOutlet UITextView *summaryMedicineTextView;
@property (weak, nonatomic) IBOutlet UITextField *summaryTestPrescribedTextView;

@property (weak, nonatomic) IBOutlet UIButton *summarySymptomsHistoryButton;
@property (weak, nonatomic) IBOutlet UIButton *summaryDiagnosisHistoryButton;
@property (weak, nonatomic) IBOutlet UIButton *summaryMedicineHistoryButton;
@property (weak, nonatomic) IBOutlet UIButton *summaryTestPrescribedHistoryButton;
@property (weak, nonatomic) IBOutlet UIButton *summarySaveButton;

@property (weak, nonatomic) IBOutlet UITextView *doctorsNoteSymptomsTextView;
@property (weak, nonatomic) IBOutlet UITextView *doctorsNoteDiagnosisTextView;
@property (weak, nonatomic) IBOutlet UITextView *doctorsNoteNoteTextView;
@property (weak, nonatomic) IBOutlet UIButton *doctorsNoteSaveButton;
@property(nonatomic,retain) NSArray *patientAppointmentArray;
@property(nonatomic,retain) NSMutableArray *objForMedicine;


@property (weak, nonatomic) IBOutlet UIButton *invoiceAddButton;
- (IBAction)invoiceAdd:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *invoiceCheckButton;
- (IBAction)invoiceCheck:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *invoiceTotalField;
@property (weak, nonatomic) IBOutlet UITextField *invoiceDiscountMinusField;
@property (weak, nonatomic) IBOutlet UITextField *invoiceDiscountTotalField;
@property (weak, nonatomic) IBOutlet UITextField *invoiceTaxMinusField;
@property (weak, nonatomic) IBOutlet UITextField *invoiceTaxTotalField;
@property (weak, nonatomic) IBOutlet UITextField *invoiceGrandTotalField;
@property (weak, nonatomic) IBOutlet UITextField *invoiceAdvanceField;
@property (weak, nonatomic) IBOutlet UITextField *invoiceTotalDueField;
@property (weak, nonatomic) IBOutlet UIButton *invoiceSaveButton;
- (IBAction)invoiceSave:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *invoiceScrollCollection;

@property (weak, nonatomic) IBOutlet UICollectionView *invoiceCollection;

@property (weak, nonatomic) IBOutlet UIScrollView *invoiceScroll;






//need to add
@property (weak, nonatomic) IBOutlet UIButton *summaryPrescribedButton;
- (IBAction)summaryPrescribed:(id)sender;
@property IBOutlet NSString *summaryDiagnosis;
@property IBOutlet NSString *summarySymptoms;
@property IBOutlet NSString *summaryReferredBy;
@property IBOutlet NSString *summaryTestPres;
@property IBOutlet NSString *summaryViDate;
@property IBOutlet NSString *summaryViType;

//end

@property(nonatomic,retain) NSMutableArray *arrayForCollectionView;
@property(nonatomic,retain) NSMutableArray *arrayHeader;
@property(nonatomic,retain) NSMutableArray *arrayValue;

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
@property NSString *returnString;

@end
