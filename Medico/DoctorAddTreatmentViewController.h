//
//  DoctorAddTreatmentViewController.h
//  Medico
//
//  Created by APPLE on 24/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorAddTreatmentViewController : UIViewController<UITableViewDataSource, UITableViewDelegate,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>


@property (retain, nonatomic)  UIPickerView *picker;
@property (nonatomic,retain) NSArray *pickerCategoryArr;

@property (weak, nonatomic) IBOutlet UITextField *searchProcedureField;
@property (weak, nonatomic) IBOutlet UITextField *categoryField;
@property (weak, nonatomic) IBOutlet UIButton *searchProcedureButton;
- (IBAction)searchProcedure:(id)sender;

@property IBOutlet NSArray *procedureArr;
@property (weak, nonatomic) IBOutlet UITableView *procedureTable;





@end
