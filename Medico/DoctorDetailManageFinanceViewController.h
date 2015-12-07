//
//  DoctorDetailManageFinanceViewController.h
//  Medico
//
//  Created by APPLE on 30/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorDetailManageFinanceViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *listScroll;

@property (weak, nonatomic) IBOutlet UIButton *listTabButton;
@property (weak, nonatomic) IBOutlet UIButton *chartTabButton;
@property (weak, nonatomic) IBOutlet UIView *listContentView;
@property (weak, nonatomic) IBOutlet UIView *chartContentView;
@property (weak, nonatomic) IBOutlet UITextField *listTotalField;
@property (weak, nonatomic) IBOutlet UITextField *listDiscountMinusField;
@property (weak, nonatomic) IBOutlet UITextField *listTotalDiscountField;
@property (weak, nonatomic) IBOutlet UITextField *listTaxAddedField;
@property (weak, nonatomic) IBOutlet UITextField *listTotalTaxField;
@property (weak, nonatomic) IBOutlet UITextField *listGrandTotalField;
@property (weak, nonatomic) IBOutlet UITextField *listAdvanceField;
@property (weak, nonatomic) IBOutlet UITextField *listTotalDueField;
@property (weak, nonatomic) IBOutlet UILabel *listDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *listDentalFlushLabel;
@property (weak, nonatomic) IBOutlet UILabel *listDentalCleaningLabel;
@property (weak, nonatomic) IBOutlet UILabel *listConsultingLabel;

@property  BOOL *keyboardVisible;
@property CGPoint offset;
@property CGFloat width;
@property CGFloat height;
@property CGFloat scrollHeight;
@property CGRect screen;

- (IBAction)listTab:(id)sender;
- (IBAction)chartTab:(id)sender;



@end
