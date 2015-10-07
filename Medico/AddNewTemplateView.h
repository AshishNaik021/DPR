//
//  AddNewTemplateView.h
//  Medico
//
//  Created by APPLE on 06/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewTemplateView : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *typeField;
@property (weak, nonatomic) IBOutlet UITextField *displayNameField;
@property (weak, nonatomic) IBOutlet UITextField *defaultValueField;
@property (weak, nonatomic) IBOutlet UIButton *addFieldsButton;
- (IBAction)addFields:(id)sender;

-(IBAction)homePage:(id)sender;



@end
