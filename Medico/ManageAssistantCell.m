//
//  ManageAssistantCell.m
//  Medico
//
//  Created by APPLE on 06/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "ManageAssistantCell.h"

@implementation ManageAssistantCell
@synthesize deleteCheck;
@synthesize deleteAssistantButton;

- (void)awakeFromNib {
    NSLog(@"ManageAssistantCell.m");
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)deleteAssistant:(id)sender {
    if(!deleteCheck){
        [deleteAssistantButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        deleteCheck = YES;
    }
    else if(deleteCheck){
        [deleteAssistantButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        deleteCheck = NO;
        
    }
}
@end
