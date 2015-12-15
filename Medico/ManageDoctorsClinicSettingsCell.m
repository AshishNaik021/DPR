//
//  ManageDoctorsClinicSettingsCell.m
//  Medico
//
//  Created by APPLE on 12/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "ManageDoctorsClinicSettingsCell.h"

@implementation ManageDoctorsClinicSettingsCell
@synthesize checkDelete;
@synthesize deleteClinicButton;

- (void)awakeFromNib {
    NSLog(@"ManageDoctorsClinicSettingsCell.m");
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)deleteClinic:(id)sender{
    if(!checkDelete){
        [deleteClinicButton setImage:[UIImage imageNamed:@"ic_check_box.png"]forState:UIControlStateNormal];
        checkDelete = YES;
    }
    else if(checkDelete){
        [deleteClinicButton setImage:[UIImage imageNamed:@"ic_check_box_outline_blank.png"]forState:UIControlStateNormal];
        checkDelete = NO;
        
    }

}
@end
