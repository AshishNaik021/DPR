//
//  SearchClinicView.h
//  Medico
//
//  Created by APPLE on 08/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SearchClinicView : UIViewController

@property IBOutlet NSArray *dataArr;

@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UITextField *searchField;

@property (weak, nonatomic) IBOutlet UIButton *pediatritionButton;
- (IBAction)pediatrician:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *dentistButton;
- (IBAction)dentist:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *generalPhysicianButton;
- (IBAction)generalPhysician:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *accupunctureButton;
- (IBAction)accupuncture:(id)sender;
- (IBAction)dermatologist:(id)sender;

- (IBAction)aurveda:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addClinicButton;
- (IBAction)addClinic:(id)sender;

- (IBAction)search:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *dermatologist;
- (IBAction)homeopathy:(id)sender;

-(IBAction)homePage:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *dermatologistButton;
@property (weak, nonatomic) IBOutlet UIButton *gynecologistButton;
- (IBAction)gynecologist:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *homeopathyButton;
@property (weak, nonatomic) IBOutlet UIButton *ayurvedaButton;

@end
