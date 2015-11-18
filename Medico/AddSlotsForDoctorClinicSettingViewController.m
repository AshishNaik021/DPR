//
//  AddSlotsForDoctorClinicSettingViewController.m
//  Medico
//
//  Created by Apple on 16/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "AddSlotsForDoctorClinicSettingViewController.h"

@interface AddSlotsForDoctorClinicSettingViewController ()

@end

@implementation AddSlotsForDoctorClinicSettingViewController
@synthesize slot3ContentView;
@synthesize slot2ContentView;
@synthesize slot1ContentView;
@synthesize slot3RemoveButton;
@synthesize slot2RemoveButton;
@synthesize slot2AddButton;
@synthesize slot1AddButton;
@synthesize slot1FriBool;
@synthesize slot1FriButton;
@synthesize slot1FromAmPmField;
@synthesize slot1FromHourField;
@synthesize slot1FromMinuteField;
@synthesize slot1MonBool;
@synthesize slot1MonButton;
@synthesize slot1SatBool;
@synthesize slot1SatButton;
@synthesize slot1SelectAllBool;
@synthesize slot1SelectAllButton;
@synthesize slot1SunBool;
@synthesize slot1SunButton;
@synthesize slot1ThuBool;
@synthesize slot1ThuButton;
@synthesize slot1ToAmPmField;
@synthesize slot1ToHourField;
@synthesize slot1ToMinuteField;
@synthesize slot1TueBool;
@synthesize slot1TueButton;
@synthesize slot1WedBool;
@synthesize slot1WedButton;
@synthesize slot2FriBool;
@synthesize slot2FriButton;
@synthesize slot2FromAmPmField;
@synthesize slot2FromHourField;
@synthesize slot2FromMinuteField;
@synthesize slot2MonBool;
@synthesize slot2MonButton;
@synthesize slot2SatBool;
@synthesize slot2SatButton;
@synthesize slot2SelectAllBool;
@synthesize slot2SelectAllButton;
@synthesize slot2SunBool;
@synthesize slot2SunButton;
@synthesize slot2ThuBool;
@synthesize slot2ThuButton;
@synthesize slot2ToAmPmField;
@synthesize slot2ToHourField;
@synthesize slot2ToMinuteField;
@synthesize slot2TueBool;
@synthesize slot2TueButton;
@synthesize slot2WedBool;
@synthesize slot2WedButton;
@synthesize slot3FriBool;
@synthesize slot3FriButton;
@synthesize slot3FromAmPmField;
@synthesize slot3FromHourField;
@synthesize slot3FromMinuteField;
@synthesize slot3MonBool;
@synthesize slot3MonButton;
@synthesize slot3SatBool;
@synthesize slot3SatButton;
@synthesize slot3SelectAllBool;
@synthesize slot3SelectAllButton;
@synthesize slot3SunBool;
@synthesize slot3SunButton;
@synthesize slot3ThuBool;
@synthesize slot3ThuButton;
@synthesize slot3ToAmPmField;
@synthesize slot3ToHourField;
@synthesize slot3ToMinuteField;
@synthesize slot3TueBool;
@synthesize slot3TueButton;
@synthesize slot3WedBool;
@synthesize slot3WedButton;
@synthesize dict;
@synthesize shift1;
@synthesize shift2;
@synthesize shift3;
@synthesize slot1MonDay;
@synthesize slot1TueDay;
@synthesize slot1WedDay;
@synthesize slot1ThuDay;
@synthesize slot1FriDay;
@synthesize slot1SatDay;
@synthesize slot1SunDay;




- (void)viewDidLoad {
    [super viewDidLoad];

    slot1ContentView.hidden = FALSE;
    slot2ContentView.hidden = TRUE;
    slot3ContentView.hidden = TRUE;
}


-(void)errorAllFieldsMandatory{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"All fields are mandatory." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

/*------------------------------------Slot1 Validations-------------------------------------------------*/

-(void)errorMessageSlot1FromHourNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Mobile Number." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot1FromHr:(NSString *) slot1FromHr{
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot1FromHr]){
        [self errorMessageSlot1FromHourNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot1ToHourNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Mobile Number." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot1ToHr:(NSString *) slot1ToHr{
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot1ToHr]){
        [self errorMessageSlot1ToHourNotValid];
        return 0;
    }
    else
        return 1;
}


-(void)errorMessageSlot1FromMinuteNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Mobile Number." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot1FromMin:(NSString *) slot1FromMin{
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot1FromMin]){
        [self errorMessageSlot1FromMinuteNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot1ToMinuteNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Mobile Number." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot1ToMin:(NSString *) slot1ToMin{
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot1ToMin]){
        [self errorMessageSlot1ToMinuteNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot1FromAmPmNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot1FromAmPm:(NSString *) slot1FromAmPm{
    
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot1FromAmPm]){
        [self errorMessageSlot1FromAmPmNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot1ToAmPmNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot1ToAmPm:(NSString *) slot1ToAmPm{
    
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot1ToAmPm]){
        [self errorMessageSlot1FromAmPmNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessaggeSlot1CheckBox{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please select the slot Day." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}


-(BOOL)validateSlot1AllFields:(NSString *)slot1fromhr : (NSString *)slot1frommin : (NSString *)slot1fromampm :(NSString *) slot1tohr : (NSString *)slot1tomin :(NSString *)slot1toampm{
    if ([self validateSlot1FromHr:slot1fromhr]
        && [self validateSlot1FromMin:slot1frommin]
        && [self validateSlot1FromAmPm:slot1fromampm]
        && [self validateSlot1ToHr:slot1tohr]
        && [self validateSlot1ToMin:slot1tomin]
        && [self validateSlot1ToAmPm:slot1toampm]) {
        return 1;
    }
    else{
        return 0;
    }
    
}

-(void)callValidateSlot1AllFields{
    
    if([self validateSlot1AllFields:slot1FromHourField.text
                              :slot1FromMinuteField.text
                              :slot1FromAmPmField.text
                              :slot1ToHourField.text
                              :slot1ToMinuteField.text
                              :slot1ToAmPmField.text]){
        NSLog(@"Sending data to next vc");
        NSString *slot1From = [NSString stringWithFormat:@"%@:%@ %@",slot1FromHourField.text,slot1FromMinuteField.text,slot1FromAmPmField.text];

        NSString *slot1To = [NSString stringWithFormat:@"%@:%@ %@",slot1ToHourField.text,slot1ToMinuteField.text,slot1ToAmPmField.text];
        
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        [arr addObject:slot1MonDay];
        [arr addObject:slot1TueDay];
        [arr addObject:slot1WedDay];
        [arr addObject:slot1ThuDay];
        [arr addObject:slot1FriDay];
        [arr addObject:slot1SatDay];
        [arr addObject:slot1SunDay];
      

        NSLog(@"The day array............%@",arr);
        
        NSArray *objects=[[NSArray alloc]initWithObjects:
                          slot1From,
                          slot1To,
                          shift1,
                          nil];
        NSArray *keys=[[NSArray alloc]initWithObjects:
                       @"from",
                       @"to",
                       @"shift",
                       nil];
        
        dict = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        
        NSLog(@"The Slot1 data in the dictionary is************************%@",dict);
        
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                           options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                             error:&error];
        
        if (! jsonData) {
            NSLog(@"Got an error: %@", error);
        } else {
            NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            NSLog(@"jsonstring %@",jsonString);
        }
        
    }
    else {
        NSLog(@"Data invalid");
    }
}





/*-------------------------------------------------------------------------------------------------------*/

/*------------------------------------Slot2 Validations-------------------------------------------------*/

-(void)errorMessageSlot2FromHourNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Mobile Number." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot2FromHr:(NSString *) slot2FromHr{
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot2FromHr]){
        [self errorMessageSlot2FromHourNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot2ToHourNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Mobile Number." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot2ToHr:(NSString *) slot2ToHr{
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot2ToHr]){
        [self errorMessageSlot2ToHourNotValid];
        return 0;
    }
    else
        return 1;
}


-(void)errorMessageSlot2FromMinuteNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Mobile Number." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot2FromMin:(NSString *) slot2FromMin{
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot2FromMin]){
        [self errorMessageSlot2FromMinuteNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot2ToMinuteNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Mobile Number." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot2ToMin:(NSString *) slot2ToMin{
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot2ToMin]){
        [self errorMessageSlot2ToMinuteNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot2FromAmPmNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot2FromAmPm:(NSString *) slot2FromAmPm{
    
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot2FromAmPm]){
        [self errorMessageSlot2FromAmPmNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot2ToAmPmNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot2ToAmPm:(NSString *) slot2ToAmPm{
    
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot2ToAmPm]){
        [self errorMessageSlot2FromAmPmNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessaggeSlot2CheckBox{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please Agree with terms and conditions to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

/*-------------------------------------------------------------------------------------------------------*/

/*------------------------------------Slot3 Validations-------------------------------------------------*/

-(void)errorMessageSlot3FromHourNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Mobile Number." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot3FromHr:(NSString *) slot3FromHr{
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot3FromHr]){
        [self errorMessageSlot3FromHourNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot3ToHourNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Mobile Number." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot3ToHr:(NSString *) slot3ToHr{
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot3ToHr]){
        [self errorMessageSlot3ToHourNotValid];
        return 0;
    }
    else
        return 1;
}


-(void)errorMessageSlot3FromMinuteNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Mobile Number." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot3FromMin:(NSString *) slot3FromMin{
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot3FromMin]){
        [self errorMessageSlot3FromMinuteNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot3ToMinuteNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Mobile Number." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot3ToMin:(NSString *) slot3ToMin{
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot3ToMin]){
        [self errorMessageSlot3ToMinuteNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot3FromAmPmNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot3FromAmPm:(NSString *) slot3FromAmPm{
    
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot3FromAmPm]){
        [self errorMessageSlot3FromAmPmNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot3ToAmPmNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot3ToAmPm:(NSString *) slot3ToAmPm{
    
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot3ToAmPm]){
        [self errorMessageSlot3FromAmPmNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessaggeSlot3CheckBox{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please Agree with terms and conditions to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

/*-------------------------------------------------------------------------------------------------------*/


- (IBAction)done:(id)sender {
    
    if (slot1ContentView.hidden == FALSE && slot2ContentView.hidden == FALSE && slot3ContentView.hidden == FALSE) {
        
        NSLog(@"All the view are not hidden....");
    }
    else if (slot1ContentView.hidden == FALSE && slot2ContentView.hidden == FALSE && slot3ContentView.hidden == TRUE){
        NSLog(@"Slot1 and Slot2 shown....");

    }
    else if (slot1ContentView.hidden == FALSE && slot2ContentView.hidden == TRUE && slot3ContentView.hidden == FALSE){
        NSLog(@"Slot1 and slot3 shown....");
        
    }
    
    else{
        NSLog(@"slot1 shown....");
        shift1 = @"shift1";
        if ([slot1FromHourField.text isEqualToString:@""]
            && [slot1FromMinuteField.text isEqualToString:@""]
            && [slot1FromAmPmField.text isEqualToString:@""]
            && [slot1ToHourField.text isEqualToString:@""]
            && [slot1ToMinuteField.text isEqualToString:@""]
            && [slot1ToAmPmField.text isEqualToString:@""]) {
            NSLog(@"All Empty");
            [self errorAllFieldsMandatory];
        }
        else{
            if (slot1MonBool || slot1TueBool || slot1WedBool || slot1ThuBool || slot1FriBool || slot1SatBool || slot1SunBool) {
                NSLog(@"Checked and calling func");
                [self callValidateSlot1AllFields];
            }
            else{
                NSLog(@"Check button");
                [self errorMessaggeSlot1CheckBox];
            }
        }

    }
    
}








- (IBAction)slot1Mon:(id)sender{
    if(!slot1MonBool){
        [slot1MonButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot1MonBool = YES;
        slot1MonDay = @"Mon";
        
    }
    else if(slot1MonBool){
        [slot1MonButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot1MonBool = NO;
        slot1MonDay = @"";
    }

    
}
- (IBAction)slot1Tue:(id)sender{
    if(!slot1TueBool){
        [slot1TueButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot1TueBool = YES;
        slot1TueDay = @"Tue";
    }
    else if(slot1TueBool){
        [slot1TueButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot1TueBool = NO;
        slot1TueDay = @"";
        
    }
    
}
- (IBAction)slot1Wed:(id)sender{
    if(!slot1WedBool){
        [slot1WedButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot1WedBool = YES;
        slot1WedDay = @"Wed";
    }
    else if(slot1WedBool){
        [slot1WedButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot1WedBool = NO;
        slot1WedDay = @"";
        
    }
}
- (IBAction)slot1Thu:(id)sender{
    if(!slot1ThuBool){
        [slot1ThuButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot1ThuBool = YES;
        slot1ThuDay = @"Thu";
    }
    else if(slot1ThuBool){
        [slot1ThuButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot1ThuBool = NO;
        slot1ThuDay = @"";
        
    }
}
- (IBAction)slot1Fri:(id)sender{
    if(!slot1FriBool){
        [slot1FriButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot1FriBool = YES;
        slot1FriDay = @"Fri";
    }
    else if(slot1FriBool){
        [slot1FriButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot1FriBool = NO;
        slot1FriDay = @"";
        
    }
    
}
- (IBAction)slot1Sat:(id)sender{
    if(!slot1SatBool){
        [slot1SatButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot1SatBool = YES;
        slot1SatDay = @"Sat";
    }
    else if(slot1SatBool){
        [slot1SatButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot1SatBool = NO;
        slot1SatDay = @"";
        
    }
}
- (IBAction)slot1Sun:(id)sender{
    if(!slot1SunBool){
        [slot1SunButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot1SunBool = YES;
        slot1SunDay = @"Sun";
    }
    else if(slot1SunBool){
        [slot1SunButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot1SunBool = NO;
        slot1SunDay = @"";
        
    }
}


- (IBAction)slot2Mon:(id)sender{
    if(!slot2MonBool){
        [slot2MonButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot2MonBool = YES;
    }
    else if(slot2MonBool){
        [slot2MonButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot2MonBool = NO;
        
    }
    
}
- (IBAction)slot2Tue:(id)sender{
    if(!slot2TueBool){
        [slot2TueButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot2TueBool = YES;
    }
    else if(slot2TueBool){
        [slot2TueButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot2TueBool = NO;
        
    }
    
}
- (IBAction)slot2Wed:(id)sender{
    if(!slot2WedBool){
        [slot2WedButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot2WedBool = YES;
    }
    else if(slot2WedBool){
        [slot2WedButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot2WedBool = NO;
        
    }
    
}
- (IBAction)slot2Thu:(id)sender{
    
    if(!slot2ThuBool){
        [slot2ThuButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot2ThuBool = YES;
    }
    else if(slot2ThuBool){
        [slot2ThuButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot2ThuBool = NO;
        
    }
}
- (IBAction)slot2Fri:(id)sender{
    if(!slot2FriBool){
        [slot2FriButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot2FriBool = YES;
    }
    else if(slot2FriBool){
        [slot2FriButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot2FriBool = NO;
        
    }

}
- (IBAction)slot2Sat:(id)sender{
    if(!slot2SatBool){
        [slot2SatButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot2SatBool = YES;
    }
    else if(slot2SatBool){
        [slot2SatButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot2SatBool = NO;
        
    }
}
- (IBAction)slot2Sun:(id)sender{
    if(!slot2SunBool){
        [slot2SunButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot2SunBool = YES;
    }
    else if(slot2SunBool){
        [slot2SunButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot2SunBool = NO;
        
    }
}


- (IBAction)slot3Mon:(id)sender{
    if(!slot3MonBool){
        [slot3MonButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot3MonBool = YES;
    }
    else if(slot3MonBool){
        [slot3MonButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot3MonBool = NO;
        
    }
}
- (IBAction)slot3Tue:(id)sender{
    if(!slot3TueBool){
        [slot3TueButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot3TueBool = YES;
    }
    else if(slot3TueBool){
        [slot3TueButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot3TueBool = NO;
        
    }
}
- (IBAction)slot3Wed:(id)sender{
    if(!slot3WedBool){
        [slot3WedButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot3WedBool = YES;
    }
    else if(slot3WedBool){
        [slot3WedButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot3WedBool = NO;
        
    }
}
- (IBAction)slot3Thu:(id)sender{
    if(!slot3ThuBool){
        [slot3ThuButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot3ThuBool = YES;
    }
    else if(slot3ThuBool){
        [slot3ThuButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot3ThuBool = NO;
        
    }

}
- (IBAction)slot3Fri:(id)sender{
    if(!slot3FriBool){
        [slot3FriButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot3FriBool = YES;
    }
    else if(slot3FriBool){
        [slot3FriButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot3FriBool = NO;
        
    }

}
- (IBAction)slot3Sat:(id)sender{
    if(!slot3SatBool){
        [slot3SatButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot3SatBool = YES;
    }
    else if(slot3SatBool){
        [slot3SatButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot3SatBool = NO;
        
    }
}
- (IBAction)slot3Sun:(id)sender{
    if(!slot3SunBool){
        [slot3SunButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot3SunBool = YES;
    }
    else if(slot3SunBool){
        [slot3SunButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot3SunBool = NO;
        
    }
}


- (IBAction)slot1Add:(id)sender{
    
    slot2ContentView.hidden = FALSE;
    
}
- (IBAction)slot2Add:(id)sender{
    
    slot3ContentView.hidden = FALSE;
    
}
- (IBAction)slot2Remove:(id)sender{
    
    slot2ContentView.hidden = TRUE;
    
}
- (IBAction)slot3Remove:(id)sender{
    slot3ContentView.hidden = TRUE;
    
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

- (IBAction)slot1SelectAll:(id)sender {
    if (!slot1SelectAllBool) {
        
        [slot1MonButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        [slot1TueButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        [slot1WedButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        [slot1ThuButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        [slot1FriButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        [slot1SatButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        [slot1SunButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        [slot1SelectAllButton setTitle:@"DeSelect All" forState:UIControlStateNormal];
        slot1SelectAllBool = YES;
        
    }
    
    else if(slot1SelectAllBool){
        [slot1MonButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        [slot1TueButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        [slot1WedButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        [slot1ThuButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        [slot1FriButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        [slot1SatButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        [slot1SunButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        [slot1SelectAllButton setTitle:@"Select All" forState:UIControlStateNormal];
        slot1SelectAllBool = NO;
    }
    

}

- (IBAction)slot2SelectAll:(id)sender {
    if (!slot2SelectAllBool) {
        
        [slot2MonButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        [slot2TueButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        [slot2WedButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        [slot2ThuButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        [slot2FriButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        [slot2SatButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        [slot2SunButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        [slot2SelectAllButton setTitle:@"DeSelect All" forState:UIControlStateNormal];
        slot2SelectAllBool = YES;
    }
    
    else if(slot2SelectAllBool){
        [slot2MonButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        [slot2TueButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        [slot2WedButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        [slot2ThuButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        [slot2FriButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        [slot2SatButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        [slot2SunButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        [slot2SelectAllButton setTitle:@"Select All" forState:UIControlStateNormal];
        slot2SelectAllBool = NO;
    }

}

- (IBAction)slot3SelectAll:(id)sender {
    if (!slot3SelectAllBool) {
        
        [slot3MonButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        [slot3TueButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        [slot3WedButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        [slot3ThuButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        [slot3FriButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        [slot3SatButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        [slot3SunButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        [slot3SelectAllButton setTitle:@"DeSelect All" forState:UIControlStateNormal];
        slot3SelectAllBool = YES;
    }
    
    else if(slot3SelectAllBool){
        [slot3MonButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        [slot3TueButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        [slot3WedButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        [slot3ThuButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        [slot3FriButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        [slot3SatButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        [slot3SunButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        [slot3SelectAllButton setTitle:@"Select All" forState:UIControlStateNormal];
        slot3SelectAllBool = NO;
    }

}

@end
