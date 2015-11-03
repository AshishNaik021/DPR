//
//  DetailPatientProfileViewController.h
//  Medico
//
//  Created by APPLE on 10/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailPatientProfileViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property IBOutlet NSArray *detailArr;

@property (weak, nonatomic) IBOutlet UIImageView *patientPicture;
@property (weak, nonatomic) IBOutlet UILabel *patientNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *patientSpecialityField;
@property (weak, nonatomic) IBOutlet UILabel *lastVisitedField;
@property (weak, nonatomic) IBOutlet UIView *profileView;
@property (weak, nonatomic) IBOutlet UIView *appointmentView;
@property IBOutlet NSArray *jsonList;
@property IBOutlet NSArray *arrayList1;
@property IBOutlet NSArray *arrayList2;
@property IBOutlet NSArray *arrayList3;
@property IBOutlet NSArray *passPatientData;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *mobileField;
@property (weak, nonatomic) IBOutlet UITextField *genderField;
@property (weak, nonatomic) IBOutlet UITextField *dateofBirthField;
@property (weak, nonatomic) IBOutlet UITextField *locationField;
@property (weak, nonatomic) IBOutlet UITextField *bloodGroupField;
@property (weak, nonatomic) IBOutlet UITextView *allergicTextView;




@property (weak, nonatomic) IBOutlet UIButton *appointmentTabButton;
@property (weak, nonatomic) IBOutlet UIButton *profileTabButton;

- (IBAction)profileTab:(id)sender;

- (IBAction)appointmentTab:(id)sender;


-(IBAction)homePage:(id)sender;

@end

