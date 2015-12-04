//
//  MedicinePrescribedScheduleViewController.m
//  Medico
//
//  Created by APPLE on 26/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "MedicinePrescribedScheduleViewController.h"
#import "DoctorLandingPageView.h"

@interface MedicinePrescribedScheduleViewController ()

@end

@implementation MedicinePrescribedScheduleViewController

@synthesize doctorsInstructionTextView;
@synthesize scheduleTimeTextView;
@synthesize check;
@synthesize medicineReminderButton;
@synthesize medicineNameField;
@synthesize scheduleField;
@synthesize numberOfDosesField;
@synthesize totalMedicationDurationField;
@synthesize startDateButton;
@synthesize endDateButton;
@synthesize saveButton;
@synthesize startDateField;
@synthesize endDateField;
@synthesize dict;

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

- (void)viewDidLoad {
    NSLog(@"MedicinePrescribedScheduleViewController.m");
    [super viewDidLoad];
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Medicine Schedule";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    [doctorsInstructionTextView.layer setBorderWidth:1.0];
    [scheduleTimeTextView.layer setBorderWidth:1.0];
    check = NO;
    
    // Do any additional setup after loading the view.
}

-(void)errorAllFieldsMandatory{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"All fields are mandatory." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(void)errorMessageMedicineNameNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter Medicine name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateMedicineName:(NSString *) medicineName{
    
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:medicineName]){
        [self errorMessageMedicineNameNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageScheduleNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter Schedule for medicine." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateScheduleName:(NSString *) scheduleName{
    
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:scheduleName]){
        [self errorMessageScheduleNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageDosesNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter number of doses for medicine." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateDoses:(NSString *) doses{
    
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:doses]){
        [self errorMessageDosesNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageDurationNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter total duration for medicine." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateDuration:(NSString *) duration{
    
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:duration]){
        [self errorMessageDurationNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageStartDateNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter starting date for medicine." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateStartDate:(NSString *) start{
    
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:start]){
        [self errorMessageStartDateNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageEndDateNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter ending date for medicine." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateEndDate:(NSString *) end{
    
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:end]){
        [self errorMessageEndDateNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageScheduleTimeNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter Schedule Time for medicine." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateScheduleTime:(NSString *) time{
    
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:time]){
        [self errorMessageScheduleTimeNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageDoctorInstructionNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter doctor instruction for medicine." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateDoctorInstruction:(NSString *) instruction{
    
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:instruction]){
        [self errorMessageDoctorInstructionNotValid];
        return 0;
    }
    else
        return 1;
}

-(BOOL)validateAllFields:(NSString *)medicineName : (NSString *)scheduleName : (NSString *) doses : (NSString *)duration : (NSString *)start : (NSString *)end : (NSString *)scheduleTime : (NSString *)instruction{
    
    if ([self validateMedicineName:medicineName]
        && [self validateScheduleName:scheduleName]
        && [self validateDoses:doses]
        && [self validateDuration:duration]
        && [self validateStartDate:start]
        && [self validateEndDate:end]
        && [self validateScheduleTime:scheduleTime]
        && [self validateDoctorInstruction:instruction]) {
        return 1;
    }
    else{
        return 0;
    }
    
}

-(void)callValidateAllFields{
    
    if([self validateAllFields:medicineNameField.text
                              :scheduleField.text
                              :numberOfDosesField.text
                              :totalMedicationDurationField.text
                              :startDateField.text
                              :endDateField.text
                              :scheduleTimeTextView.text
                              :doctorsInstructionTextView.text]){
        NSLog(@"Sending data to next vc");
        NSArray *objects=[[NSArray alloc]initWithObjects:
                          medicineNameField.text,
                          scheduleField.text,
                          numberOfDosesField.text,
                          totalMedicationDurationField.text,
                          startDateField.text,
                          endDateField.text,
                          scheduleTimeTextView.text,
                          doctorsInstructionTextView.text,
                          nil];
        NSArray *keys=[[NSArray alloc]initWithObjects:
                       @"medicineName",
                       @"scheduleField",
                       @"numberDoses",
                       @"totalDuration",
                       @"startDate",
                       @"endDate",
                       @"scheduleTime",
                       @"instruction",
                       nil];
        
        dict = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        
        NSLog(@"The data in the dictionary is************************%@",dict);
        
        NSError *error;
        //   NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
        // options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
        //  error:&error];
    }
    else {
        NSLog(@"Data invalid");
    }
}

-(void)errorMessaggeCheckBox{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please check Medicine Reminder to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
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

- (IBAction)save:(id)sender {
    
    if ([medicineNameField.text isEqualToString:@""]
        && [scheduleField.text isEqualToString:@""]
        && [numberOfDosesField.text isEqualToString:@""]
        && [totalMedicationDurationField.text isEqualToString:@""]
        && [startDateField.text isEqualToString:@""]
        && [endDateField.text isEqualToString:@""]
        && [scheduleTimeTextView.text isEqualToString:@""]
        && [doctorsInstructionTextView.text isEqualToString:@""]) {
        NSLog(@"All Empty");
        [self errorAllFieldsMandatory];
    }
    else{
        if (check) {
            NSLog(@"Checked and calling func");
            [self callValidateAllFields];
        }
        else{
            NSLog(@"Check button");
            [self errorMessaggeCheckBox];
        }
    }
    
    
}

- (IBAction)medicineReminder:(id)sender {
    if(!check){
        [medicineReminderButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        check = YES;
    }
    else if(check){
        [medicineReminderButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        check = NO;
        
    }
    
}

- (IBAction)startDate:(id)sender {
}

- (IBAction)endDate:(id)sender {
}
@end
