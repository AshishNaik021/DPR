//
//  DoctorSettingPageView.h
//  Medico
//
//  Created by APPLE on 07/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorSettingPageView : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *doctorNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *manageAssistantButton;
- (IBAction)manageAssistant:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *manageTemplatebutton;
- (IBAction)manageTemplate:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *manageClinicsButton;
- (IBAction)manageClinics:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *smsNotificationButton;
- (IBAction)smsNotification:(id)sender;

-(IBAction)homePage:(id)sender;




@end
