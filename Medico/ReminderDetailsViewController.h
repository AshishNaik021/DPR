//
//  ReminderDetailsViewController.h
//  Medico
//
//  Created by APPLE on 29/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReminderDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *setDateTimeButton;
@property (weak, nonatomic) IBOutlet UILabel *discussionLabel;

- (IBAction)setDateTimeAlarm:(id)sender;

@property IBOutlet NSArray *detailReminderArray;


@end
