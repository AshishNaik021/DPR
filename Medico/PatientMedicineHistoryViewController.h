//
//  PatientMedicineHistoryViewController.h
//  Medico
//
//  Created by Apple on 25/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientMedicineHistoryViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property NSArray *medicineArr;

@end
