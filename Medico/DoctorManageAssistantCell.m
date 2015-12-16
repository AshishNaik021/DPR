//
//  DoctorManageAssistantCell.m
//  Medico
//
//  Created by Apple on 16/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DoctorManageAssistantCell.h"

@implementation DoctorManageAssistantCell
@synthesize deleteCheck;
@synthesize deleteAssistantButton;

- (void)awakeFromNib {
    NSLog(@"DoctorManageAssistantCell.m");
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)deleteAssistant:(id)sender {
    if(!deleteCheck){
        [deleteAssistantButton setImage:[UIImage imageNamed:@"ic_check_box.png"]forState:UIControlStateNormal];
        deleteCheck = YES;
    }
    else if(deleteCheck){
        [deleteAssistantButton setImage:[UIImage imageNamed:@"ic_check_box_outline_blank.png"]forState:UIControlStateNormal];
        deleteCheck = NO;
        
    }
}


@end
