//
//  DoctorManageAssistantCell.h
//  Medico
//
//  Created by Apple on 16/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorManageAssistantCell : UITableViewCell
@property IBOutlet UIImageView *assistantImg;
@property IBOutlet UIButton *deleteAssistantButton;
@property IBOutlet UILabel *assistantNameLabel;
@property IBOutlet UILabel *assistantCityLabel;
- (IBAction)deleteAssistant:(id)sender;
@property IBOutlet UILabel *assistantProfileLabel;
@property BOOL *deleteCheck;
@end
