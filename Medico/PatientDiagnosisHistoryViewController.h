//
//  PatientDiagnosisHistoryViewController.h
//  Medico
//
//  Created by Apple on 25/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientDiagnosisHistoryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property NSArray *diagnosisArr;

@end
