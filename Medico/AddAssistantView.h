//
//  AddAssistantView.h
//  Medico
//
//  Created by APPLE on 06/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface AddAssistantView : UIViewController<UITextFieldDelegate>
@property IBOutlet UIButton *createNewBtn;
-(IBAction)checkBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *changeImageButton;
- (IBAction)changeImage:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *mobileField;
@property (weak, nonatomic) IBOutlet UITextField *genderField;
@property (weak, nonatomic) IBOutlet UITextField *dateofBirthField;
@property (weak, nonatomic) IBOutlet UIButton *calendarButton;
- (IBAction)addCalendar:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *locationField;
@property (weak, nonatomic) IBOutlet UITextField *professionField;
@property (weak, nonatomic) IBOutlet UITextView *specializationField;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property (weak, nonatomic) IBOutlet UIButton *readTCButton;
- (IBAction)readTermConditions:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *createAssistantButton;
- (IBAction)createAssistant:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;
- (IBAction)addLocation:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *bloodGroupField;
@property IBOutlet NSString *loggedInUserEmailId;
@property IBOutlet NSDictionary *dict;
@property IBOutlet NSString *returnString;
@property BOOL *CreateNew;

@property  BOOL *keyboardVisible;
@property CGPoint offset;
@property CGFloat width;
@property CGFloat height;
@property CGFloat scrollHeight;
@property CGRect screen;

@end
