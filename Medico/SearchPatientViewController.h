//
//  SearchPatientViewController.h
//  Medico
//
//  Created by APPLE on 21/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchPatientViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *searchPatientField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
- (IBAction)searchPatient:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *puneRadioButton;
@property (weak, nonatomic) IBOutlet UIButton *bangloreRadioButton;
@property (weak, nonatomic) IBOutlet UIButton *mumbaiRadioButton;
@property (weak, nonatomic) IBOutlet UIButton *delhiRadioButton;
- (IBAction)puneRadio:(id)sender;
- (IBAction)bangloreRadio:(id)sender;
- (IBAction)mumbaiRadio:(id)sender;
- (IBAction)delhiRadio:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addPatientButton;
- (IBAction)addPatient:(id)sender;




@end
