//
//  ManageReminderCell.h
//  Medico
//
//  Created by APPLE on 29/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManageReminderCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *reminderTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *reminderDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *reminderTimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *checkForDeleteReminderButton;
- (IBAction)checkFroDeleteReminder:(id)sender;
@property BOOL checkDelete;

@end
