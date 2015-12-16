//
//  AddNewTemplateView.h
//  Medico
//
//  Created by APPLE on 06/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewTemplateView : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *systemNameField;
@property (weak, nonatomic) IBOutlet UITextField *typeField;
@property (weak, nonatomic) IBOutlet UITextField *displayNameField;
@property (weak, nonatomic) IBOutlet UITextField *defaultValueField;
@property (weak, nonatomic) IBOutlet UIButton *addFieldsButton;
- (IBAction)addFields:(id)sender;
@property NSString *returnString;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@property IBOutlet NSString *passTemplateId;
@property IBOutlet NSDictionary *dict;

@property  BOOL *keyboardVisible;
@property CGPoint offset;
@property CGFloat width;
@property CGFloat height;
@property CGFloat scrollHeight;
@property CGRect screen;

@end
