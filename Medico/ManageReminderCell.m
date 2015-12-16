//
//  ManageReminderCell.m
//  Medico
//
//  Created by APPLE on 29/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "ManageReminderCell.h"

@implementation ManageReminderCell
@synthesize checkDelete;
@synthesize checkForDeleteReminderButton;

- (void)awakeFromNib {
    NSLog(@"ManageReminderCell.m");
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)checkFroDeleteReminder:(id)sender {
    if(!checkDelete){
        [checkForDeleteReminderButton setImage:[UIImage imageNamed:@"ic_check_box.png"]forState:UIControlStateNormal];
        checkDelete = YES;
    }
    else if(checkDelete){
        [checkForDeleteReminderButton setImage:[UIImage imageNamed:@"ic_check_box_outline_blank.png"]forState:UIControlStateNormal];
        checkDelete = NO;
        
    }

}
@end
