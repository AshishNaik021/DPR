//
//  AllDetailDocumentInformationCell.h
//  Medico
//
//  Created by Apple on 30/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllDetailDocumentInformationCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *documentNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *clinicNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *allergyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *documentImage;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@end
