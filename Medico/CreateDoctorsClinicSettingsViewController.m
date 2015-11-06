//
//  CreateDoctorsClinicSettingsViewController.m
//  Medico
//
//  Created by APPLE on 15/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "CreateDoctorsClinicSettingsViewController.h"

@interface CreateDoctorsClinicSettingsViewController ()

@end

@implementation CreateDoctorsClinicSettingsViewController

@synthesize createClinicButton;
@synthesize createClinicNameField;
@synthesize createEmailField;
@synthesize createLandLineField;
@synthesize createLocationTextView;
@synthesize createMobileField;
@synthesize createSlotTextView;
@synthesize alwaysButton;
@synthesize exceptCurrentDayButton;
@synthesize exceptCurrentSlotButton;
@synthesize confirmByDoctorButton;
@synthesize createSpecialtyTextView;

- (void)viewDidLoad {
    NSLog(@"CreateDoctorsClinicSettingsViewController.m");
    [super viewDidLoad];
    [createSpecialtyTextView.layer setBorderWidth:1.0];
    [createLocationTextView.layer setBorderWidth:1.0];
    [createSlotTextView.layer setBorderWidth:1.0];
    // Do any additional setup after loading the view.
}

-(void)errorAllFieldsMandatory{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"All fields are mandatory." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(void)errorMessageNameNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateName:(NSString *) name{
    
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:name]){
        [self errorMessageNameNotValid];
        return 0;
    }
    else
        return 1;
}
-(void)errorMessageEmailNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Email." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateEmail:(NSString *) email{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", emailRegex];
    
    if ([emailTest evaluateWithObject:email]){
        return 1;
    }
    else{
        [self errorMessageEmailNotValid];
        return 0;
    }
}

-(void)errorMessageMobileNumberNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Mobile Number." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateMobileNumber:(NSString *) mobileNumber{
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:mobileNumber]){
        [self errorMessageMobileNumberNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageLandlineNumberNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Mobile Number." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateLandlineNumber:(NSString *) landlineNumber{
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:landlineNumber]){
        [self errorMessageMobileNumberNotValid];
        return 0;
    }
    else
        return 1;
}


-(void)errorMessageLocationNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Location." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateLocation:(NSString *) location{
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![location isEqualToString:@""] && [nameTest evaluateWithObject:location]){
        return 1;
    }
    else
        return 0;
}

-(void)errorMessaggeSpecialityNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Speciality." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(BOOL)validateSpeciality:(NSString *) speciality{
    BOOL returnValue = 0;
    if ([speciality isEqualToString:@""]) {
        returnValue =  1;
    }
    else{
        NSString *nameRegex = @"[a-z]+";
        NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
        
        if([nameTest evaluateWithObject:speciality]){
            returnValue = 1;
        }
        else
            returnValue = 0;
    }
    return returnValue;
}

-(void)errorMessageOnlineAppointmentNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateOnlineAppointment:(NSString *) name{
    
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:name]){
        [self errorMessageNameNotValid];
        return 0;
    }
    else
        return 1;
}


-(BOOL)validateAllFields:(NSString *)name : (NSString *)email : (NSString *)mobile :(NSString *) landline : (NSString *)location :(NSString *)speciality{
    if ([self validateName:name]
        && [self validateEmail:email]
        && [self validateMobileNumber:mobile]
        && [self validateLocation:location]
        && [self validateSpeciality:speciality]
        && [self validateLandlineNumber:landline]) {
        return 1;
    }
    else{
        return 0;
    }
    
}



-(void)callValidateAllFields{
    
    if([self validateAllFields:createClinicNameField.text
                              :createEmailField.text
                              :createMobileField.text
                              :createLandLineField.text
                              :createLocationTextView.text
                              :createSpecialtyTextView.text]){
        NSLog(@"Sending data to next vc");
        NSArray *objects=[[NSArray alloc]initWithObjects:
                          createClinicNameField.text,
                          createEmailField.text,
                          createMobileField.text,
                          createLandLineField.text,
                          createLocationTextView.text,
                          createSpecialtyTextView.text,
                          @"false",
                          @"null",
                          nil];
        NSArray *keys=[[NSArray alloc]initWithObjects:
                       @"clinicName",
                       @"email",
                       @"mobileNumber",
                       @"landLineNumber",
                       @"location",
                       @"speciality",
                       @"selected",
                       @"parameter",
                       nil];
        
        NSDictionary *dict=[NSDictionary dictionaryWithObjects:objects forKeys:keys];
        /*   SMSConfirmationView *viewController =
         [self.storyboard instantiateViewControllerWithIdentifier:@"SMSConfirmationView"];
         viewController.data = dict;
         NSLog(@"is dic copied? %@",viewController.data);
         [self.navigationController pushViewController:viewController animated:YES];*/
    }
    else {
        NSLog(@"Data invalid");
    }
}



-(void)errorMessaggeCheckBox{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please Agree with terms and conditions to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
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

- (IBAction)always:(id)sender {
}

- (IBAction)exceptCurrentSlot:(id)sender {
}

- (IBAction)exceptCurrentDay:(id)sender {
}

- (IBAction)confirmByDoctor:(id)sender {
}
- (IBAction)createClinic:(id)sender {
    if ([createClinicNameField.text isEqualToString:@""]
        && [createEmailField.text isEqualToString:@""]
        && [createMobileField.text isEqualToString:@""]
        && [createLandLineField.text isEqualToString:@""]
        && [createLocationTextView.text isEqualToString:@""]
        && [createSpecialtyTextView.text isEqualToString:@""]) {
        NSLog(@"All Empty");
        [self errorAllFieldsMandatory];
    }
    else{
        /*  if (doctorchecked) {
         NSLog(@"Checked and calling func");
         [self callValidateAllFields];
         }
         else{
         NSLog(@"Check button");
         [self errorMessaggeCheckBox];
         }
         }*/
        NSLog(@"In Else Part.......");
        [self callValidateAllFields];
        
    }
    
}
@end
