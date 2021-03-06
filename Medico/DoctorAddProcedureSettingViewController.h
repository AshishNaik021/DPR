//
//  DoctorAddProcedureSettingViewController.h
//  Medico
//
//  Created by Apple on 16/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorAddProcedureSettingViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *procedureNameField;
@property (weak, nonatomic) IBOutlet UITextField *catagoryTypeField;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
- (IBAction)add:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
- (IBAction)cancel:(id)sender;

@property (retain, nonatomic)  UIPickerView *picker;
@property (nonatomic,retain) NSArray *pickerCategoryArr;


@end
