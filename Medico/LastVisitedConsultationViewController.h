//
//  LastVisitedConsultationViewController.h
//  Medico
//
//  Created by APPLE on 24/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LastVisitedConsultationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *visitedButton;
@property (weak, nonatomic) IBOutlet UIButton *notVisitedButton;
@property (nonatomic) BOOL isVisitedClicked;
@property (nonatomic) BOOL isNotVisitedClicked;
@property (nonatomic) BOOL isVisited;
- (IBAction)visitedClicked:(id)sender;
- (IBAction)notVisitedClicked:(id)sender;

@end
