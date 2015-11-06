//
//  DetailClinicView.h
//  Medico
//
//  Created by APPLE on 09/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailClinicView : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *NameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *mobileField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNoField;
@property (weak, nonatomic) IBOutlet UITextField *locationField;
@property (weak, nonatomic) IBOutlet UITextView *locationTextView;

@property (weak, nonatomic) IBOutlet UITextView *specialityField;
@property (weak, nonatomic) IBOutlet UITextView *slotsField;
@property (weak, nonatomic) IBOutlet UIButton *alwaysButton;
- (IBAction)always:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *currentSlotButton;
- (IBAction)currentSlot:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *currentDayButton;
- (IBAction)currentDay:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *doctorSlotButton;
- (IBAction)doctorSlot:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *manageClinicButton;
- (IBAction)manageClinic:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;
- (IBAction)addLocation:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
- (IBAction)save:(id)sender;
-(IBAction)homePage:(id)sender;
@property IBOutlet NSArray *editClinicPassArr;
@property IBOutlet NSString *passClinicName;
@property IBOutlet NSString *passClinicId;
@property IBOutlet NSMutableArray *CopyEditArr;
@property IBOutlet NSNumber *clinicId;
@end
