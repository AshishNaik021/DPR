//
//  DoctorDetailManageAppointmentViewController.m
//  Medico
//
//  Created by APPLE on 21/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DoctorDetailManageAppointmentViewController.h"
#import "DoctorLandingPageView.h"
#import "DoctorManageAppointmentsViewController.h"

@interface DoctorDetailManageAppointmentViewController ()

@end

@implementation DoctorDetailManageAppointmentViewController
@synthesize passDataArr = _passDataArr;
@synthesize passDataDict = _passDataDict;

@synthesize clinicNameLabel;
@synthesize slot1AppLabel;
@synthesize slot1totalAppButton;
@synthesize slot2AppLabel;
@synthesize slot2TotalAppButton;
@synthesize slot3AppLabel;
@synthesize slot3TotalAppButton;
@synthesize detailAppArr;
@synthesize detailSlot1 = _detailSlot1;
@synthesize detailSlot2 = _detailSlot2;
@synthesize detailSlot3 = _detailSlot3;
@synthesize profileContentView;
@synthesize profileTabButton;
@synthesize appointmentContentView;
@synthesize appointmentTabButton;
@synthesize slot1DaysLabel;
@synthesize slot1TimeLabel;
@synthesize slot1AppButton;
@synthesize slot2AppButton;
@synthesize slot2DaysLabel;
@synthesize slot2TimeLabel;
@synthesize slot3AppButton;
@synthesize slot3DaysLabel;
@synthesize slot3TimeLabel;
@synthesize addressTextView;
@synthesize profileAssistantField;
@synthesize profileEmailField;
@synthesize profileLandlineField;
@synthesize profileLocationField;
@synthesize profileMobileField;
@synthesize profilePracticeNameField;
@synthesize profileServicesTextView;


- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Data copied into the array........................%@",_passDataArr);
    NSLog(@"Data copied into the slo1 array........................%@",_detailSlot1);
    NSLog(@"Data copied into the slot2 array........................%@",_detailSlot2);
    NSLog(@"Data copied into the slot3 array........................%@",_detailSlot3);


    clinicNameLabel.text = [_passDataArr valueForKey:@"clinicName"];
   
    if (![_detailSlot1 isEqual:[NSNull null]]) {
        if (![[_detailSlot1 valueForKey:@"shiftTime"] isEqual:[NSNull null]]) {
            slot1AppLabel.text = [_detailSlot1 valueForKey:@"shiftTime"];
        }
    }
    else
    {
        slot1AppLabel.text = @"";
    }
    
    if (![_detailSlot2 isEqual:[NSNull null]]) {
        if (![[_detailSlot2 valueForKey:@"shiftTime"] isEqual:[NSNull null]]) {
            slot2AppLabel.text = [_detailSlot2 valueForKey:@"shiftTime"];
        }
    }
    else
    {
        slot2AppLabel.text = @"";
    }
    
    if (![_detailSlot3 isEqual:[NSNull null]]) {
        if (![[_detailSlot3 valueForKey:@"shiftTime"] isEqual:[NSNull null]]) {
            slot3AppLabel.text = [_detailSlot3 valueForKey:@"shiftTime"];
        }
    }
    else
    {
        slot3AppLabel.text = @"";
    }
    
    if (![_detailSlot1 isEqual:[NSNull null]]) {
        if (![[_detailSlot1 valueForKey:@"days"] isEqual:[NSNull null]]) {
            slot1DaysLabel.text = [_detailSlot1 valueForKey:@"days"];
        }
    }
    else
    {
        slot1DaysLabel.text = @"Not Available!";
    }
    
    if (![_detailSlot2 isEqual:[NSNull null]]) {
        if (![[_detailSlot2 valueForKey:@"days"] isEqual:[NSNull null]]) {
            slot2DaysLabel.text = [_detailSlot2 valueForKey:@"days"];
        }
    }
    else
    {
        slot2DaysLabel.text = @"Not Available!";
    }
    
    if (![_detailSlot3 isEqual:[NSNull null]]) {
        if (![[_detailSlot3 valueForKey:@"days"] isEqual:[NSNull null]]) {
            slot3DaysLabel.text = [_detailSlot3 valueForKey:@"days"];
        }
    }
    else
    {
        slot3DaysLabel.text = @"Not Available!";
    }
    
    
    
    

    if (![_detailSlot1 isEqual:[NSNull null]]) {
        if (![[_detailSlot1 valueForKey:@"shiftTime"] isEqual:[NSNull null]]) {
            slot1TimeLabel.text = [_detailSlot1 valueForKey:@"shiftTime"];
        }
    }
    else
    {
        slot1TimeLabel.text = @"";
    }
    
    if (![_detailSlot2 isEqual:[NSNull null]]) {
        if (![[_detailSlot2 valueForKey:@"shiftTime"] isEqual:[NSNull null]]) {
            slot2TimeLabel.text = [_detailSlot2 valueForKey:@"shiftTime"];
        }
    }
    else
    {
        slot2TimeLabel.text = @"";
    }
    
    
    if (![_detailSlot3 isEqual:[NSNull null]]) {
        if (![[_detailSlot3 valueForKey:@"shiftTime"] isEqual:[NSNull null]]) {
            slot3TimeLabel.text = [_detailSlot3 valueForKey:@"shiftTime"];
        }
    }
    else
    {
        slot3TimeLabel.text = @"";
    }

    
   // slot1AppLabel.text = [_detailSlot1[0] objectForKey:@"shiftTime"];
   // slot2AppLabel.text = [_detailSlot2[0] objectForKey:@"shiftTime"];
   //  slot3AppLabel.text = [_detailSlot3[0] objectForKey:@"shiftTime"];
    
  
    if (![_detailSlot1 isEqual:[NSNull null]]) {
        if (![[_detailSlot1 valueForKey:@"appointmentCount"] isEqual:[NSNull null]]) {
            [slot1totalAppButton setTitle:[NSString stringWithFormat:@"%@",[_detailSlot1 valueForKey:@"appointmentCount"]] forState:UIControlStateNormal];
        }
    }
    else
    {
        [slot1totalAppButton setTitle:@"" forState:UIControlStateNormal];
    }
    
    if (![_detailSlot2 isEqual:[NSNull null]]) {
        if (![[_detailSlot2 valueForKey:@"appointmentCount"] isEqual:[NSNull null]]) {
            [slot2TotalAppButton setTitle:[NSString stringWithFormat:@"%@",[_detailSlot2 valueForKey:@"appointmentCount"]] forState:UIControlStateNormal];
        }
    }
    else
    {
        [slot2TotalAppButton setTitle:@"" forState:UIControlStateNormal];
    }
    
    if (![_detailSlot3 isEqual:[NSNull null]]) {
        if (![[_detailSlot3 valueForKey:@"appointmentCount"] isEqual:[NSNull null]]) {
            [slot3TotalAppButton setTitle:[NSString stringWithFormat:@"%@",[_detailSlot3 valueForKey:@"appointmentCount"]] forState:UIControlStateNormal];
        }
    }
    else
    {
        [slot3TotalAppButton setTitle:@"" forState:UIControlStateNormal];
    }
    
    
    
    
    if (![_detailSlot1 isEqual:[NSNull null]]) {
        if (![[_detailSlot1 valueForKey:@"appointmentCount"] isEqual:[NSNull null]]) {
            [slot1AppButton setTitle:[NSString stringWithFormat:@"%@",[_detailSlot1 valueForKey:@"appointmentCount"]] forState:UIControlStateNormal];
        }
    }
    else
    {
        [slot1AppButton setTitle:@"" forState:UIControlStateNormal];
    }

    if (![_detailSlot2 isEqual:[NSNull null]]) {
        if (![[_detailSlot2 valueForKey:@"appointmentCount"] isEqual:[NSNull null]]) {
            [slot2AppButton setTitle:[NSString stringWithFormat:@"%@",[_detailSlot2 valueForKey:@"appointmentCount"]] forState:UIControlStateNormal];
        }
    }
    else
    {
        [slot2AppButton setTitle:@"" forState:UIControlStateNormal];
    }
    if (![_detailSlot3 isEqual:[NSNull null]]) {
        if (![[_detailSlot3 valueForKey:@"appointmentCount"] isEqual:[NSNull null]]) {
            [slot3AppButton setTitle:[NSString stringWithFormat:@"%@",[_detailSlot3 valueForKey:@"appointmentCount"]] forState:UIControlStateNormal];
        }
    }
    else
    {
        [slot3AppButton setTitle:@"" forState:UIControlStateNormal];
    }


    
    //[slot1totalAppButton setTitle:[_detailSlot1[0] objectForKey:@"appointmentCount"] forState:UIControlStateNormal];
   // [slot2TotalAppButton setTitle:[_detailSlot2[0] objectForKey:@"appointmentCount"] forState:UIControlStateNormal];
  //  [slot3TotalAppButton setTitle:[_detailSlot3[0] objectForKey:@"appointmentCount"] forState:UIControlStateNormal];

    profileContentView.hidden = TRUE;
    appointmentContentView.hidden = FALSE;
    self.appointmentTabButton.titleLabel.textColor = [UIColor blackColor];
    [self.appointmentTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Manage Appointments";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    [profileServicesTextView.layer setBorderWidth:1.0];
    [addressTextView.layer setBorderWidth:1.0];


    

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)profileTab:(id)sender {
    self.profileContentView.hidden = FALSE;
    self.appointmentContentView.hidden = TRUE;
    [self.profileTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.appointmentTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
}
- (IBAction)appointmentTab:(id)sender {
    self.appointmentContentView.hidden = FALSE;
    self.profileContentView.hidden = TRUE;
    [self.profileTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [self.appointmentTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    

}
- (IBAction)hideDetails:(id)sender {
    DoctorManageAppointmentsViewController *manageApp =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorManageAppointmentsViewController"];
    [self.navigationController pushViewController:manageApp animated:YES];
}
- (IBAction)slot1TotalApp:(id)sender {
}
- (IBAction)slot2TotalApp:(id)sender {
}
- (IBAction)slot3TotalApp:(id)sender {
}
@end
