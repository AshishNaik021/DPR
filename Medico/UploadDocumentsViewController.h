//
//  UploadDocumentsViewController.h
//  Medico
//
//  Created by APPLE on 26/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UploadDocumentsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *uploadContentView;
@property (weak, nonatomic) IBOutlet UITextField *categoryField;
@property (weak, nonatomic) IBOutlet UITextField *clinicNameField;
@property (weak, nonatomic) IBOutlet UITextField *reportTypeField;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIButton *captureImageButton;
- (IBAction)captureImage:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *browseField;
@property (weak, nonatomic) IBOutlet UIButton *browseImageButton;
- (IBAction)browseImage:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
- (IBAction)save:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
- (IBAction)close:(id)sender;




@end
