//
//  DoctorDetailManageAppointmentViewController.h
//  Medico
//
//  Created by APPLE on 21/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorDetailManageAppointmentViewController : UIViewController
@property IBOutlet NSArray *detailAppArr;
@property IBOutlet NSArray *detailSlot1;

@property IBOutlet NSArray *detailSlot2;

@property IBOutlet NSArray *detailSlot3;
@property (weak, nonatomic) IBOutlet UILabel *clinicNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot1AppLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot2AppLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot3AppLabel;
@property (weak, nonatomic) IBOutlet UIButton *slot1totalAppButton;
@property (weak, nonatomic) IBOutlet UIButton *slot2TotalAppButton;
@property (weak, nonatomic) IBOutlet UIButton *slot3TotalAppButton;


@end

