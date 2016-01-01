//
//  AddSlotsForDoctorClinicSettingViewController.h
//  Medico
//
//  Created by Apple on 16/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"


@interface AddSlotsForDoctorClinicSettingViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>


@property (retain, nonatomic)  UIPickerView *slot1FromHourPicker;
@property (retain, nonatomic)  UIPickerView *slot1FromMinutePicker;
@property (retain, nonatomic)  UIPickerView *slot1FromAmPmPicker;

@property (retain, nonatomic)  UIPickerView *slot1ToHourPicker;
@property (retain, nonatomic)  UIPickerView *slot1ToMinutePicker;
@property (retain, nonatomic)  UIPickerView *slot1ToAmPmPicker;

@property (retain, nonatomic)  UIPickerView *slot2FromHourPicker;
@property (retain, nonatomic)  UIPickerView *slot2FromMinutePicker;
@property (retain, nonatomic)  UIPickerView *slot2FromAmPmPicker;

@property (retain, nonatomic)  UIPickerView *slot2ToHourPicker;
@property (retain, nonatomic)  UIPickerView *slot2ToMinutePicker;
@property (retain, nonatomic)  UIPickerView *slot2ToAmPmPicker;

@property (retain, nonatomic)  UIPickerView *slot3FromHourPicker;
@property (retain, nonatomic)  UIPickerView *slot3FromMinutePicker;
@property (retain, nonatomic)  UIPickerView *slot3FromAmPmPicker;

@property (retain, nonatomic)  UIPickerView *slot3ToHourPicker;
@property (retain, nonatomic)  UIPickerView *slot3ToMinutePicker;
@property (retain, nonatomic)  UIPickerView *slot3ToAmPmPicker;

@property (nonatomic,retain) NSArray *hourPickerArr;
@property (nonatomic,retain) NSArray *minutePickerArr;
@property (nonatomic,retain) NSArray *amPmPickerArr;

@property NSString *passClinicId;
@property NSString *passDoctorId;
@property(weak) MBProgressHUD *hud;
@property NSString *scheduleString;
@property NSString *returnStringSlot;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
- (IBAction)cancel:(id)sender;


@property (weak, nonatomic) IBOutlet UIView *slot1ContentView;
@property (weak, nonatomic) IBOutlet UIView *slot2ContentView;
@property (weak, nonatomic) IBOutlet UIView *slot3ContentView;
@property (weak, nonatomic) IBOutlet UIButton *slot1AddButton;
@property (weak, nonatomic) IBOutlet UIButton *slot2AddButton;
@property (weak, nonatomic) IBOutlet UIButton *slot2RemoveButton;
@property (weak, nonatomic) IBOutlet UIButton *slot3RemoveButton;
- (IBAction)slot1SelectAll:(id)sender;
- (IBAction)slot2SelectAll:(id)sender;
- (IBAction)slot3SelectAll:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *slot1SelectAllButton;
@property (weak, nonatomic) IBOutlet UIButton *slot2SelectAllButton;
@property (weak, nonatomic) IBOutlet UIButton *slot3SelectAllButton;

@property (weak,nonatomic) IBOutlet UITextField *slot1FromHourField;
@property (weak,nonatomic) IBOutlet UITextField *slot1FromMinuteField;
@property (weak,nonatomic) IBOutlet UITextField *slot1ToHourField;
@property (weak,nonatomic) IBOutlet UITextField *slot1ToMinuteField;
@property (weak,nonatomic) IBOutlet UITextField *slot1FromAmPmField;
@property (weak,nonatomic) IBOutlet UITextField *slot1ToAmPmField;

@property (weak,nonatomic) IBOutlet UITextField *slot2FromHourField;
@property (weak,nonatomic) IBOutlet UITextField *slot2FromMinuteField;
@property (weak,nonatomic) IBOutlet UITextField *slot2ToHourField;
@property (weak,nonatomic) IBOutlet UITextField *slot2ToMinuteField;
@property (weak,nonatomic) IBOutlet UITextField *slot2FromAmPmField;
@property (weak,nonatomic) IBOutlet UITextField *slot2ToAmPmField;

@property (weak,nonatomic) IBOutlet UITextField *slot3FromHourField;
@property (weak,nonatomic) IBOutlet UITextField *slot3FromMinuteField;
@property (weak,nonatomic) IBOutlet UITextField *slot3ToHourField;
@property (weak,nonatomic) IBOutlet UITextField *slot3ToMinuteField;
@property (weak,nonatomic) IBOutlet UITextField *slot3FromAmPmField;
@property (weak,nonatomic) IBOutlet UITextField *slot3ToAmPmField;

@property (weak, nonatomic) IBOutlet UIButton *slot1MonButton;
@property (weak, nonatomic) IBOutlet UIButton *slot1TueButton;
@property (weak, nonatomic) IBOutlet UIButton *slot1WedButton;
@property (weak, nonatomic) IBOutlet UIButton *slot1ThuButton;
@property (weak, nonatomic) IBOutlet UIButton *slot1FriButton;
@property (weak, nonatomic) IBOutlet UIButton *slot1SatButton;
@property (weak, nonatomic) IBOutlet UIButton *slot1SunButton;

@property (weak, nonatomic) IBOutlet UIButton *slot2MonButton;
@property (weak, nonatomic) IBOutlet UIButton *slot2TueButton;
@property (weak, nonatomic) IBOutlet UIButton *slot2WedButton;
@property (weak, nonatomic) IBOutlet UIButton *slot2ThuButton;
@property (weak, nonatomic) IBOutlet UIButton *slot2FriButton;
@property (weak, nonatomic) IBOutlet UIButton *slot2SatButton;
@property (weak, nonatomic) IBOutlet UIButton *slot2SunButton;

@property (weak, nonatomic) IBOutlet UIButton *slot3MonButton;
@property (weak, nonatomic) IBOutlet UIButton *slot3TueButton;
@property (weak, nonatomic) IBOutlet UIButton *slot3WedButton;
@property (weak, nonatomic) IBOutlet UIButton *slot3ThuButton;
@property (weak, nonatomic) IBOutlet UIButton *slot3FriButton;
@property (weak, nonatomic) IBOutlet UIButton *slot3SatButton;
@property (weak, nonatomic) IBOutlet UIButton *slot3SunButton;


- (IBAction)slot1Mon:(id)sender;
- (IBAction)slot1Tue:(id)sender;
- (IBAction)slot1Wed:(id)sender;
- (IBAction)slot1Thu:(id)sender;
- (IBAction)slot1Fri:(id)sender;
- (IBAction)slot1Sat:(id)sender;
- (IBAction)slot1Sun:(id)sender;


- (IBAction)slot2Mon:(id)sender;
- (IBAction)slot2Tue:(id)sender;
- (IBAction)slot2Wed:(id)sender;
- (IBAction)slot2Thu:(id)sender;
- (IBAction)slot2Fri:(id)sender;
- (IBAction)slot2Sat:(id)sender;
- (IBAction)slot2Sun:(id)sender;


- (IBAction)slot3Mon:(id)sender;
- (IBAction)slot3Tue:(id)sender;
- (IBAction)slot3Wed:(id)sender;
- (IBAction)slot3Thu:(id)sender;
- (IBAction)slot3Fri:(id)sender;
- (IBAction)slot3Sat:(id)sender;
- (IBAction)slot3Sun:(id)sender;


- (IBAction)slot1Add:(id)sender;
- (IBAction)slot2Add:(id)sender;
- (IBAction)slot2Remove:(id)sender;
- (IBAction)slot3Remove:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property IBOutlet NSDictionary *dict;
@property IBOutlet NSString *shift1;
@property IBOutlet NSString *shift2;
@property IBOutlet NSString *shift3;

@property IBOutlet NSDictionary *mondaySlot1Arr;
@property IBOutlet NSDictionary *tuesdaySlot1Arr;
@property IBOutlet NSDictionary *wednesdaySlot1Arr;
@property IBOutlet NSDictionary *thursdaySlot1Arr;
@property IBOutlet NSDictionary *fridaySlot1Arr;
@property IBOutlet NSDictionary *saturdaySlot1Arr;
@property IBOutlet NSDictionary *sundaySlot1Arr;

@property IBOutlet NSDictionary *mondaySlot2Arr;
@property IBOutlet NSDictionary *tuesdaySlot2Arr;
@property IBOutlet NSDictionary *wednesdaySlot2Arr;
@property IBOutlet NSDictionary *thursdaySlot2Arr;
@property IBOutlet NSDictionary *fridaySlot2Arr;
@property IBOutlet NSDictionary *saturdaySlot2Arr;
@property IBOutlet NSDictionary *sundaySlot2Arr;

@property IBOutlet NSDictionary *mondaySlot3Arr;
@property IBOutlet NSDictionary *tuesdaySlot3Arr;
@property IBOutlet NSDictionary *wednesdaySlot3Arr;
@property IBOutlet NSDictionary *thursdaySlot3Arr;
@property IBOutlet NSDictionary *fridaySlot3Arr;
@property IBOutlet NSDictionary *saturdaySlot3Arr;
@property IBOutlet NSDictionary *sundaySlot3Arr;

@property  int *indexCount;
@property int *indexCount1;
@property int *indexCount2;

@property int *integer;

- (IBAction)done:(id)sender;

@property BOOL *slot1MonBool;
@property BOOL *slot1TueBool;
@property BOOL *slot1WedBool;
@property BOOL *slot1ThuBool;
@property BOOL *slot1FriBool;
@property BOOL *slot1SatBool;
@property BOOL *slot1SunBool;
@property BOOL *slot1SelectAllBool;


@property IBOutlet NSString *slot1MonDay;
@property IBOutlet NSString *slot1TueDay;
@property IBOutlet NSString *slot1WedDay;
@property IBOutlet NSString *slot1ThuDay;
@property IBOutlet NSString *slot1FriDay;
@property IBOutlet NSString *slot1SatDay;
@property IBOutlet NSString *slot1SunDay;

@property IBOutlet NSString *slot2MonDay;
@property IBOutlet NSString *slot2TueDay;
@property IBOutlet NSString *slot2WedDay;
@property IBOutlet NSString *slot2ThuDay;
@property IBOutlet NSString *slot2FriDay;
@property IBOutlet NSString *slot2SatDay;
@property IBOutlet NSString *slot2SunDay;

@property IBOutlet NSString *slot3MonDay;
@property IBOutlet NSString *slot3TueDay;
@property IBOutlet NSString *slot3WedDay;
@property IBOutlet NSString *slot3ThuDay;
@property IBOutlet NSString *slot3FriDay;
@property IBOutlet NSString *slot3SatDay;
@property IBOutlet NSString *slot3SunDay;

@property BOOL *slot2MonBool;
@property BOOL *slot2TueBool;
@property BOOL *slot2WedBool;
@property BOOL *slot2ThuBool;
@property BOOL *slot2FriBool;
@property BOOL *slot2SatBool;
@property BOOL *slot2SunBool;
@property BOOL *slot2SelectAllBool;

@property BOOL *slot3MonBool;
@property BOOL *slot3TueBool;
@property BOOL *slot3WedBool;
@property BOOL *slot3ThuBool;
@property BOOL *slot3FriBool;
@property BOOL *slot3SatBool;
@property BOOL *slot3SunBool;
@property BOOL *slot3SelectAllBool;

@end
