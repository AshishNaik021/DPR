//
//  MarkAndCreateAppointmentViewController.m
//  Medico
//
//  Created by APPLE on 28/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "MarkAndCreateAppointmentViewController.h"

@interface MarkAndCreateAppointmentViewController ()

@end

@implementation MarkAndCreateAppointmentViewController


- (void)viewDidLoad {
    NSLog(@"MarkAndCreateAppointmentViewController.m");
    [super viewDidLoad];
    
    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Create Appointment";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
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
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField.returnKeyType==UIReturnKeyNext) {
        UIView *next = [[textField superview] viewWithTag:textField.tag+1];
        [next becomeFirstResponder];
        //[textField resignFirstResponder];
    }else if (textField.returnKeyType==UIReturnKeyDone) {
        [textField resignFirstResponder];
    }
    
    return YES;
}

- (IBAction)createAppointment:(id)sender {
}
- (IBAction)markAs:(id)sender {
}
- (IBAction)allSlots:(id)sender {
}
- (IBAction)selectedSlots:(id)sender {
}
- (IBAction)selectTime:(id)sender {
}
- (IBAction)wholeWeek:(id)sender {
}
- (IBAction)save:(id)sender {
}
@end
