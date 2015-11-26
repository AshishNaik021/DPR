//
//  PatientPDFDocumentCell.h
//  Medico
//
//  Created by Apple on 26/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientPDFDocumentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *documentNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pdfImageView;

@end
