//
//  PatientSearchDoctorViewController.h
//  Medico
//
//  Created by APPLE on 20/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientSearchDoctorViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIButton *pediatricianButton;
@property (weak, nonatomic) IBOutlet UIButton *dermatologistButton;
@property (weak, nonatomic) IBOutlet UIButton *dentistButton;
@property (weak, nonatomic) IBOutlet UIButton *gynecologistButton;
@property (weak, nonatomic) IBOutlet UIButton *generalPurposeButton;
@property (weak, nonatomic) IBOutlet UIButton *homeopathyButton;
@property (weak, nonatomic) IBOutlet UIButton *ayurvedaButton;
@property (weak, nonatomic) IBOutlet UIButton *acupunctureButton;

- (IBAction)search:(id)sender;
- (IBAction)pediatricianDoctor:(id)sender;
- (IBAction)dermatologistDoctor:(id)sender;
- (IBAction)dentistDoctor:(id)sender;
- (IBAction)gynecologistDoctor:(id)sender;
- (IBAction)generalPhysicianDoctor:(id)sender;
- (IBAction)homeopathyDoctor:(id)sender;
- (IBAction)ayurvedaDoctor:(id)sender;
- (IBAction)acupunctureDoctor:(id)sender;





@end
