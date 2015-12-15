//
//  SymptomsHistoryCell.h
//  Medico
//
//  Created by Apple on 15/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SymptomsHistoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *editedByLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *previousTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *updatedTextLabel;

@end
