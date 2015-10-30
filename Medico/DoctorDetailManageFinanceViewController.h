//
//  DoctorDetailManageFinanceViewController.h
//  Medico
//
//  Created by APPLE on 30/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorDetailManageFinanceViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *listTabButton;
@property (weak, nonatomic) IBOutlet UIButton *chartTabButton;
@property (weak, nonatomic) IBOutlet UIView *listContentView;
@property (weak, nonatomic) IBOutlet UIView *chartContentView;


- (IBAction)listTab:(id)sender;
- (IBAction)chartTab:(id)sender;



@end
