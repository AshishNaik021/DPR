//
//  SearchPatientForDoctorViewController.h
//  Medico
//
//  Created by APPLE on 21/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchPatientForDoctorViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property IBOutlet NSMutableArray *jsonList;

@end
