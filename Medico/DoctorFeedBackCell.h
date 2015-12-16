//
//  DoctorFeedBackCell.h
//  Medico
//
//  Created by Apple on 16/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorFeedBackCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UIButton *rate1Button;
@property (weak, nonatomic) IBOutlet UIButton *rate2Button;
@property (weak, nonatomic) IBOutlet UIButton *rate3Button;
@property (weak, nonatomic) IBOutlet UIButton *rate4Button;
@property (weak, nonatomic) IBOutlet UIButton *rate5Button;
- (IBAction)rate1:(id)sender;
- (IBAction)rate2:(id)sender;
- (IBAction)rate3:(id)sender;
- (IBAction)rate4:(id)sender;
- (IBAction)rate5:(id)sender;

@end
