//
//  DetailPatientProfileCell.h
//  Medico
//
//  Created by APPLE on 23/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailPatientProfileCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *clinicNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *clinicCityLabel;
@property (weak, nonatomic) IBOutlet UILabel *mobileNoLabel;
@property (weak, nonatomic) IBOutlet UITextView *slot1Text;
@property (weak, nonatomic) IBOutlet UITextView *slot2Text;
@property (weak, nonatomic) IBOutlet UITextView *slot3Text;


@end
