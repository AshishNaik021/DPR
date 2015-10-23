//
//  PatientLandingPageViewController.h
//  Medico
//
//  Created by APPLE on 15/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientLandingPageViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property IBOutlet NSArray *image;
@property IBOutlet NSArray *titleName;
@property IBOutlet NSArray *total;
@property (weak, nonatomic) IBOutlet UILabel *pNameLabel;
@property (nonatomic, retain) NSString * patientName;
@property (nonatomic, retain) NSString * patientEmail;

- (IBAction)logout:(id)sender;

@end