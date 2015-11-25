//
//  PatientAllDetailSummaryInformationCell.h
//  Medico
//
//  Created by Apple on 25/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientAllDetailSummaryInformationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *summaryMedicineNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *summaryAlarmButton;
@property (weak, nonatomic) IBOutlet UIButton *summaryDeleteButton;


- (IBAction)summaryDelete:(id)sender;
- (IBAction)summaryAlarm:(id)sender;


@end
