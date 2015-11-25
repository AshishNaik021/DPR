//
//  AllDetailInformationCell.h
//  Medico
//
//  Created by Apple on 25/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllDetailInformationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *medicineNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *medicineAlarmButton;
@property (weak, nonatomic) IBOutlet UIButton *medicineDeleteButton;
- (IBAction)medicineDelete:(id)sender;

- (IBAction)medicineAlarm:(id)sender;

@end
