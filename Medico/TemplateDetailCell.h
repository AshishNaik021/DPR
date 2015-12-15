//
//  TemplateDetailCell.h
//  Medico
//
//  Created by APPLE on 07/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemplateDetailCell : UITableViewCell
@property IBOutlet UITextView *nameLabel;
@property IBOutlet UILabel *systemNameLabel;
@property IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UITextView *defaultValueLabel;
@property (weak, nonatomic) IBOutlet UIButton *checkButton;
- (IBAction)check:(id)sender;
@property BOOL checkDelete;
@end
