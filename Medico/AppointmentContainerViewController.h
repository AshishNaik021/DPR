//
//  AppointmentContainerViewController.h
//  Medico
//
//  Created by APPLE on 19/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppointmentContainerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *bookOnlineAMbutton;
@property (weak, nonatomic) IBOutlet UIButton *bookOnlinePMButton;
@property (weak, nonatomic) IBOutlet UIButton *changeNextAppointmentAMButton;
@property (weak, nonatomic) IBOutlet UIButton *changeLaterAppointmentAMButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelNextAMButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelLaterAMButton;
@property (weak, nonatomic) IBOutlet UIButton *changeNextAppointmentPMButton;
@property (weak, nonatomic) IBOutlet UIButton *changeLaterAppointmentPMButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelNextPMButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelLaterPMButton;



- (IBAction)changeNextAppointmentPM:(id)sender;
- (IBAction)changeLaterAppointmentPM:(id)sender;
- (IBAction)cancelNextPM:(id)sender;
- (IBAction)cancelLaterPM:(id)sender;

- (IBAction)bookOnlineAM:(id)sender;
- (IBAction)bookOnlinePM:(id)sender;
- (IBAction)changeNextAppointmentAM:(id)sender;
- (IBAction)changeLaterAppointmentAM:(id)sender;
- (IBAction)cancelNextAM:(id)sender;
- (IBAction)cancelLaterAM:(id)sender;

@end
