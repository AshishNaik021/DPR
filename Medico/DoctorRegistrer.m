//
//  DoctorRegistrer.m
//  Medico
//
//  Created by APPLE on 05/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DoctorRegistrer.h"

@interface DoctorRegistrer ()

@end

@implementation DoctorRegistrer

@synthesize checkButton;
@synthesize nameField;
@synthesize emailField;
@synthesize changeImageButton;
@synthesize bloodGroupField;
@synthesize passwordField;
@synthesize mobileField;
@synthesize genderField;
@synthesize dateofBirthField;
@synthesize calendarButton;
@synthesize locationField;
@synthesize specializationField;
@synthesize readTCButton;
@synthesize nextButton;

-(IBAction)checkButton:(id)sender{
    if(!doctorchecked){
        [checkButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        doctorchecked = YES;
    }
    else if(doctorchecked){
        [checkButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        doctorchecked = NO;
        
    }
}

//-(BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    clearField = NO;
//    return clearField;
//}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    if(clearField)
//    {
//        textField.text = @"";
//        clearField = NO;
//    }
//    return clearField;
//}

//-(void)textFieldDidBeginEditing:(UITextField *)textField{
//    //clearField = YES;
//    if (textField == genderField || dateofBirthField || locationField || specializationField || bloodGroupField) {
//
//
//        CGPoint scrollpoint = CGPointMake(0, textField.frame.origin.y-380);
//        [scroll setContentOffset:scrollpoint animated:YES];
//    }
//}

//-(void)textFieldDidEndEditing:(UITextField *)textField{
//    clearField = NO;
//
//    [scroll setContentOffset:CGPointZero animated:YES];
//
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    [scroll setScrollEnabled:YES];
    [scroll setContentSize:CGSizeMake(375, 1000)];
    self.dateofBirthField.placeholder = @"YYYY-DD-MM";
    doctorchecked = NO;
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
-(void)errorAllFieldsMandatory{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"All fields are mandatory." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(void)errorMessageNameNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateName:(NSString *) name{
    
    NSString *nameRegex = @"[A-Za-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
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
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    if ([emailTest evaluateWithObject:email]){
        return 1;
    }
    else{
        [self errorMessageEmailNotValid];
        return 0;
    }
}
-(void)errorMessagePasswordNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Password." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validatePassword:(NSString *) password{
    if ([password isEqualToString:@""]) {
        [self errorMessagePasswordNotValid];
        return 0;
    }
    else
        return 1;
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
-(void)errorMessageBloodGroupNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Blood Group." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(BOOL)validateBloodGroup:(NSString *) bloodGroup{
    if ([bloodGroup isEqualToString:@""]) {
        [self errorMessageBloodGroupNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageGenderNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Gender." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateGender:(NSString *) gender{
    NSString *nameRegex = @"[A-Za-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![gender isEqualToString:@""] && [nameTest evaluateWithObject:gender]){
        [self errorMessageGenderNotValid];
        return 0;
    }
    else
        return 1;
}
-(void)errorMessageDOBNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid date of birth." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(BOOL)validateDOB:(NSString *) DOB{
    if (![DOB  isEqualToString:@""])
        return 1;
    else{
        [self errorMessageDOBNotValid];
        return 0;
    }
}

-(void)errorMessageLocationNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Location." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateLocation:(NSString *) location{
    NSString *nameRegex = @"[A-Za-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
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
        NSString *nameRegex = @"[A-Za-z]+";
        NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
        
        if([nameTest evaluateWithObject:speciality]){
            returnValue = 1;
        }
        else
            returnValue = 0;
    }
    return returnValue;
}
-(BOOL)validateAllFields:(NSString *)name : (NSString *)email : (NSString *)password :(NSString *) mobileNumber : (NSString *)bloodGroup : (NSString *)gender : (NSString *)dateOfBirth : (NSString *)location :(NSString *)speciality{
    if ([self validateName:name]
        && [self validateEmail:email]
        && [self validatePassword:password]
        && [self validateMobileNumber:mobileNumber]
        && [self validateBloodGroup:bloodGroup]
        && [self validateGender:gender]
        && [self validateDOB:dateOfBirth]
        && [self validateLocation:location]
        && [self validateSpeciality:speciality]) {
        return 1;
    }
    else{
        return 0;
    }
    
}
- (IBAction)addCalendar:(id)sender {
}
- (IBAction)readTermsConditions:(id)sender {
}

-(BOOL)callValidateAllFields{
    
    [self validateAllFields:nameField.text
                           :emailField.text
                           :passwordField.text
                           :mobileField.text
                           :bloodGroupField.text
                           :genderField.text
                           :dateofBirthField.text
                           :locationField.text
                           :specializationField.text];
    return 3;
}
-(void)errorMessaggeCheckBox{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please Agree with terms and conditions to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (IBAction)next:(id)sender {
    if ([nameField.text isEqualToString:@""]
        && [emailField.text isEqualToString:@""]
        && [passwordField.text isEqualToString:@""]
        && [mobileField.text isEqualToString:@""]
        && [bloodGroupField.text isEqualToString:@""]
        && [genderField.text isEqualToString:@""]
        && [dateofBirthField.text isEqualToString:@""]
        && [locationField.text isEqualToString:@""]) {
        NSLog(@"All Empty");
        [self errorAllFieldsMandatory];
    }
    else{
        if (doctorchecked) {
            NSLog(@"Checked and calling func");
            [self callValidateAllFields];
        }
        else{
            NSLog(@"Check button");
        }
    }
}
- (IBAction)addLocation:(id)sender {
}
- (IBAction)changeImage:(id)sender {
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
}
@end
