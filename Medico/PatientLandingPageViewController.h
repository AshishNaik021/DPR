//
//  PatientLandingPageViewController.h
//  Medico
//
//  Created by APPLE on 15/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientLandingPageViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property IBOutlet NSArray *image;
@property IBOutlet NSArray *titleName;
@property IBOutlet NSArray *total;


@end
