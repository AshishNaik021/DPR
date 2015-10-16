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

-(BOOL)validateName:(NSString *) name{
    
    NSString *nameRegex = @"[A-Za-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:name]){
        return 0;
    }
    else
        return 1;
}
-(BOOL)validateEmail:(NSString *) email{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
-(BOOL)validatePassword:(NSString *) password{
    if ([password isEqualToString:@""]) {
        return 0;
    }
    else
        return 1;
}
-(BOOL)validateMobileNumber:(NSString *) mobileNumber{
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:mobileNumber]){
        return 0;
    }
    else
        return 1;
}

-(BOOL)validateBloodGroup:(NSString *) bloodGroup{
    if ([bloodGroup isEqualToString:@""]) {
        return 0;
    }
    else
        return 1;
}

-(BOOL)validateGender:(NSString *) gender{
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![gender isEqualToString:@""] && [nameTest evaluateWithObject:gender]){
        return 1;
    }
    else
        return 0;
}

-(BOOL)validateDOB:(NSString *) DOB{
    if (![DOB  isEqualToString:@""])
        return 1;
    else
        return 0;
}

-(BOOL)validateLocation:(NSString *) location{
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![location isEqualToString:@""] && [nameTest evaluateWithObject:location]){
        return 1;
    }
    else
        return 0;
}

-(BOOL)validateSpeciality:(NSString *) speciality{
    if (![speciality isEqualToString:@""]) {
        NSString *nameRegex = @"[A-Za-z]+";
        NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
        
        if([nameTest evaluateWithObject:self.nameField.text]){
            return 1;
        }
    }
    else
        return 0;
    return 1;
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
- (IBAction)next:(id)sender {
    if ([nameField.text isEqualToString:@""]
        && [emailField.text isEqualToString:@""]
        && [passwordField.text isEqualToString:@""]
        && [mobileField.text isEqualToString:@""]
        && [bloodGroupField.text isEqualToString:@""]
        && [genderField.text isEqualToString:@""]
        && [dateofBirthField.text isEqualToString:@""]
        && [locationField.text isEqualToString:@""]) {
        if ([self validateAllFields:nameField.text
                                   :emailField.text
                                   :passwordField.text
                                   :mobileField.text
                                   :bloodGroupField.text
                                   :genderField.text
                                   :dateofBirthField.text
                                   :locationField.text
                                   :specializationField.text]) {
            NSLog(@"All fields are valid do next steps here");
        }
        else{
            NSLog(@"All filled but not valid");
        }
    }
    else{
        NSLog(@"All fields are either empty or not valid");
        [self errorAllFieldsMandatory];
    }
}
- (IBAction)addLocation:(id)sender {
}
- (IBAction)changeImage:(id)sender {
}
@end
