//
//  PatientDetailSearchDoctorViewController.h
//  Medico
//
//  Created by APPLE on 20/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientDetailSearchDoctorViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
- (IBAction)searchDoctor:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *listRadioButton;
@property (weak, nonatomic) IBOutlet UIButton *mapRadioButton;
- (IBAction)listRadio:(id)sender;
- (IBAction)mapRadio:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *listContentView;
@property (weak, nonatomic) IBOutlet UIView *mapContentView;





@end
