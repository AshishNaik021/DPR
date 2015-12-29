//
//  SymptomsHistoryViewController.h
//  Medico
//
//  Created by APPLE on 26/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SymptomsHistoryViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property NSArray *symptomArr;
@property IBOutlet NSString *summaryDatePassData;
@property IBOutlet NSString *summaryTimePassData;
@property IBOutlet NSString *summaryPatientEmailPassData;
@property IBOutlet NSString *summaryDoctorIDPassData;


@end
