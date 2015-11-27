//
//  AddSlotsForDoctorClinicSettingViewController.m
//  Medico
//
//  Created by Apple on 16/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "AddSlotsForDoctorClinicSettingViewController.h"
#import "CreateDoctorsClinicSettingsViewController.h"

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
@synthesize mondaySlot1Arr;
@synthesize tuesdaySlot1Arr;
@synthesize wednesdaySlot1Arr;
@synthesize thursdaySlot1Arr;
@synthesize fridaySlot1Arr;
@synthesize saturdaySlot1Arr;
@synthesize sundaySlot1Arr;
@synthesize mondaySlot3Arr;
@synthesize tuesdaySlot3Arr;
@synthesize wednesdaySlot3Arr;
@synthesize thursdaySlot3Arr;
@synthesize fridaySlot3Arr;
@synthesize saturdaySlot3Arr;
@synthesize sundaySlot3Arr;
@synthesize mondaySlot2Arr;
@synthesize tuesdaySlot2Arr;
@synthesize wednesdaySlot2Arr;
@synthesize thursdaySlot2Arr;
@synthesize fridaySlot2Arr;
@synthesize saturdaySlot2Arr;
@synthesize sundaySlot2Arr;
@synthesize indexCount;
@synthesize indexCount1;
@synthesize slot2MonDay;
@synthesize slot2TueDay;
@synthesize slot2WedDay;
@synthesize slot2ThuDay;
@synthesize slot2FriDay;
@synthesize slot2SatDay;
@synthesize slot2SunDay;
@synthesize slot3MonDay;
@synthesize slot3TueDay;
@synthesize slot3WedDay;
@synthesize slot3ThuDay;
@synthesize slot3FriDay;
@synthesize slot3SatDay;
@synthesize slot3SunDay;
@synthesize indexCount2;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    slot1ContentView.hidden = FALSE;
    slot2ContentView.hidden = TRUE;
    slot3ContentView.hidden = TRUE;
    slot1MonDay = @"";
    slot1ThuDay = @"";
    slot1WedDay = @"";
    slot1TueDay = @"";
    slot1FriDay = @"";
    slot1SatDay = @"";
    slot1SunDay = @"";
    
    slot2MonDay = @"";
    slot2ThuDay = @"";
    slot2WedDay = @"";
    slot2TueDay = @"";
    slot2FriDay = @"";
    slot2SatDay = @"";
    slot2SunDay = @"";
    
    slot3MonDay = @"";
    slot3ThuDay = @"";
    slot3WedDay = @"";
    slot3TueDay = @"";
    slot3FriDay = @"";
    slot3SatDay = @"";
    slot3SunDay = @"";
    
    mondaySlot1Arr = [[NSDictionary alloc]init];
    thursdaySlot1Arr = [[NSDictionary alloc]init];
    tuesdaySlot1Arr = [[NSDictionary alloc]init];
    wednesdaySlot1Arr = [[NSDictionary alloc]init];
    fridaySlot1Arr = [[NSDictionary alloc]init];
    saturdaySlot1Arr = [[NSDictionary alloc]init];
    sundaySlot1Arr = [[NSDictionary alloc]init];
}


-(void)errorAllFieldsMandatory{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"All fields are mandatory." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

/*------------------------------------Slot1 Validations-------------------------------------------------*/

-(void)errorMessageSlot1FromHourNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter Slot1 Time between 1 - 12." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot1FromHr:(NSString *) slot1FromHr{
    NSString *nameRegex =  @"(0?[1-9]|1[012])";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot1FromHr]){
        [self errorMessageSlot1FromHourNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot1ToHourNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter Slot1 Time between 1 - 12." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot1ToHr:(NSString *) slot1ToHr{
    NSString *nameRegex = @"(0?[1-9]|1[012])";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot1ToHr]){
        [self errorMessageSlot1ToHourNotValid];
        return 0;
    }
    else
        return 1;
}


-(void)errorMessageSlot1FromMinuteNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid slot1 time." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot1FromMin:(NSString *) slot1FromMin{
    NSString *nameRegex = @"(0?[1-9]|1[061])";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot1FromMin]){
        [self errorMessageSlot1FromMinuteNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot1ToMinuteNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid slot1 time." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot1ToMin:(NSString *) slot1ToMin{
    NSString *nameRegex = @"(0?[1-9]|1[061])";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot1ToMin]){
        [self errorMessageSlot1ToMinuteNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot1FromAmPmNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter slot1 Am/Pm." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot1FromAmPm:(NSString *) slot1FromAmPm{
    
    NSString *nameRegex = @"[APap][mM]$";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot1FromAmPm]){
        [self errorMessageSlot1FromAmPmNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot1ToAmPmNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter slot1 Am/Pm." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot1ToAmPm:(NSString *) slot1ToAmPm{
    
    NSString *nameRegex = @"[APap][mM]$";
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
        if (![slot1MonDay isEqualToString:@""]) {
            [arr addObject:slot1MonDay];
            
            mondaySlot1Arr = @{@"day" : slot1MonDay,
                               @"from" : slot1From,
                               @"to" : slot1To,
                               @"shift" : shift1};
            
        }
        if (![slot1TueDay isEqualToString:@""]){
            [arr addObject:slot1TueDay];
            tuesdaySlot1Arr = @{@"day" : slot1TueDay,
                               @"from" : slot1From,
                               @"to" : slot1To,
                               @"shift" : shift1};
            
        }
        if (![slot1WedDay isEqualToString:@""]){
            [arr addObject:slot1WedDay];
            wednesdaySlot1Arr = @{@"day" : slot1WedDay,
                               @"from" : slot1From,
                               @"to" : slot1To,
                               @"shift" : shift1};
            
      }
        if (![slot1ThuDay isEqualToString:@""]){
            [arr addObject:slot1ThuDay];
            thursdaySlot1Arr = @{@"day" : slot1ThuDay,
                               @"from" : slot1From,
                               @"to" : slot1To,
                               @"shift" : shift1};
            
     }
        if (![slot1FriDay isEqualToString:@""]){
            [arr addObject:slot1FriDay];
            fridaySlot1Arr = @{@"day" : slot1FriDay,
                               @"from" : slot1From,
                               @"to" : slot1To,
                               @"shift" : shift1};
            
      }
        if (![slot1SatDay isEqualToString:@""]){
            [arr addObject:slot1SatDay];
            saturdaySlot1Arr = @{@"day" : slot1SatDay,
                               @"from" : slot1From,
                               @"to" : slot1To,
                               @"shift" : shift1};
            
   }
        if (![slot1SunDay isEqualToString:@""]){
            [arr addObject:slot1SunDay];
            sundaySlot1Arr = @{@"day" : slot1SunDay,
                               @"from" : slot1From,
                               @"to" : slot1To,
                               @"shift" : shift1};
            
     }
        
        NSLog(@"Total days selected.......%@",arr);
        NSLog(@"count======%lu",(unsigned long)arr.count);
        
        NSMutableArray *objects = [[NSMutableArray alloc]init];
        NSMutableArray *keys = [[NSMutableArray alloc]init];
        
        indexCount = 0;
        
        
        NSMutableArray *objectArr = [[NSMutableArray alloc]initWithCapacity:arr.count];
      
        
        
        if (![mondaySlot1Arr count] == 0) {
            [objectArr insertObject:mondaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        
        if (![tuesdaySlot1Arr count] == 0) {
            [objectArr insertObject:tuesdaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        if (![wednesdaySlot1Arr count] == 0) {
            [objectArr insertObject:wednesdaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        if (![thursdaySlot1Arr count] == 0) {
            [objectArr insertObject:thursdaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        if (![fridaySlot1Arr count] == 0) {
            [objectArr insertObject:fridaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        if (![saturdaySlot1Arr count] == 0) {
            [objectArr insertObject:saturdaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        if (![sundaySlot1Arr count] == 0) {
            [objectArr insertObject:sundaySlot1Arr atIndex:(int)indexCount/4];
        }
        
        
        NSLog(@"objectarrrrrrrrrrrrrrr%@",objectArr);
        
   
        
        NSLog(@"The day array............%lu",(unsigned long)arr.count);
        NSLog(@"keys%@",keys);
        
        dict = [NSDictionary dictionaryWithObject:objectArr forKey:@"schedules"];
        
        
        NSLog(@"The Slot1 data in the dictionary is************************%@",dict);
//        CreateDoctorsClinicSettingsViewController *createClinic =
//        [self.storyboard instantiateViewControllerWithIdentifier:@"CreateDoctorsClinicSettingsViewController"];
//        createClinic.passDictionaryForSlots = dict;
//        NSLog(@"is dic copied? %@",createClinic.passDictionaryForSlots);
//        [self.navigationController pushViewController:createClinic animated:YES];
        
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                           options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                             error:&error];
        NSLog(@"Checking valid JSON..................%@",jsonData);
        
        if (! jsonData) {
            NSLog(@"Got an error: %@", error);
        } else {
            NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            NSLog(@"jsonstring %@",jsonString);
            CreateDoctorsClinicSettingsViewController *createClinic =
            [self.storyboard instantiateViewControllerWithIdentifier:@"CreateDoctorsClinicSettingsViewController"];
            createClinic.passDictionaryForSlots = dict;
            createClinic.passString = jsonString;
            NSLog(@"is dic copied? %@",createClinic.passDictionaryForSlots);
            [self.navigationController pushViewController:createClinic animated:YES];

        }
        
    }
    else {
        NSLog(@"Data invalid");
    }
}





/*-------------------------------------------------------------------------------------------------------*/

/*------------------------------------Slot2 Validations-------------------------------------------------*/

-(void)errorMessageSlot2FromHourNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter slot2 time betwen 1 - 12." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot2FromHr:(NSString *) slot2FromHr{
    NSString *nameRegex = @"(0?[1-9]|1[012])";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot2FromHr]){
        [self errorMessageSlot2FromHourNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot2ToHourNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter slot2 time betwen 1 - 12." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot2ToHr:(NSString *) slot2ToHr{
    NSString *nameRegex = @"(0?[1-9]|1[012])";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot2ToHr]){
        [self errorMessageSlot2ToHourNotValid];
        return 0;
    }
    else
        return 1;
}


-(void)errorMessageSlot2FromMinuteNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter slot2 time." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot2FromMin:(NSString *) slot2FromMin{
    NSString *nameRegex = @"(0?[1-9]|1[061])";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot2FromMin]){
        [self errorMessageSlot2FromMinuteNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot2ToMinuteNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter slot2 time." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot2ToMin:(NSString *) slot2ToMin{
    NSString *nameRegex = @"(0?[1-9]|1[061])";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot2ToMin]){
        [self errorMessageSlot2ToMinuteNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot2FromAmPmNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter slot2 Am/Pm." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot2FromAmPm:(NSString *) slot2FromAmPm{
    
    NSString *nameRegex = @"[APap][mM]$";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot2FromAmPm]){
        [self errorMessageSlot2FromAmPmNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot2ToAmPmNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter Slot2 Am/Pm." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot2ToAmPm:(NSString *) slot2ToAmPm{
    
    NSString *nameRegex = @"[APap][mM]$";
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
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter slot3 time between 1 - 12." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot3FromHr:(NSString *) slot3FromHr{
    NSString *nameRegex = @"(0?[1-9]|1[012])";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot3FromHr]){
        [self errorMessageSlot3FromHourNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot3ToHourNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter slot3 time between 1 - 12." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot3ToHr:(NSString *) slot3ToHr{
    NSString *nameRegex = @"(0?[1-9]|1[012])";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot3ToHr]){
        [self errorMessageSlot3ToHourNotValid];
        return 0;
    }
    else
        return 1;
}


-(void)errorMessageSlot3FromMinuteNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter slot3 time." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot3FromMin:(NSString *) slot3FromMin{
    NSString *nameRegex = @"(0?[1-9]|1[061])";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot3FromMin]){
        [self errorMessageSlot3FromMinuteNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot3ToMinuteNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter slot3 time." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot3ToMin:(NSString *) slot3ToMin{
    NSString *nameRegex = @"(0?[1-9]|1[061])";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot3ToMin]){
        [self errorMessageSlot3ToMinuteNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot3FromAmPmNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter slot3 Am/Pm." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot3FromAmPm:(NSString *) slot3FromAmPm{
    
    NSString *nameRegex = @"[APap][mM]$";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:slot3FromAmPm]){
        [self errorMessageSlot3FromAmPmNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSlot3ToAmPmNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter slot3 Am/Pm." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSlot3ToAmPm:(NSString *) slot3ToAmPm{
    
    NSString *nameRegex = @"[APap][mM]$";
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
/*++++++++++++++++++++++++++++++++++++++++++++Slot1 And Slot2++++++++++++++++++++++++++++++++++++++++++++*/
-(void)errorMessaggeSlot1Slot2CheckBox{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please select the day for slots." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}


-(BOOL)validateSlot1Slot2AllFields:(NSString *)slot1fromhr : (NSString *)slot1frommin : (NSString *)slot1fromampm :(NSString *) slot1tohr : (NSString *)slot1tomin :(NSString *)slot1toampm :(NSString *)slot2fromhr : (NSString *)slot2frommin : (NSString *)slot2fromampm :(NSString *) slot2tohr : (NSString *)slot2tomin :(NSString *)slot2toampm{
    if ([self validateSlot1FromHr:slot1fromhr]
        && [self validateSlot1FromMin:slot1frommin]
        && [self validateSlot1FromAmPm:slot1fromampm]
        && [self validateSlot1ToHr:slot1tohr]
        && [self validateSlot1ToMin:slot1tomin]
        && [self validateSlot1ToAmPm:slot1toampm]
        && [self validateSlot2FromHr:slot2fromhr]
        && [self validateSlot2FromMin:slot2frommin]
        && [self validateSlot2FromAmPm:slot2fromampm]
        && [self validateSlot2ToHr:slot2tohr]
        && [self validateSlot2ToMin:slot2tomin]
        && [self validateSlot2ToAmPm:slot2toampm]) {
        return 1;
    }
    else{
        return 0;
    }
    
}

-(void)callValidateSlot1Slot2AllFields{
    
    if([self validateSlot1Slot2AllFields:slot1FromHourField.text
                                   :slot1FromMinuteField.text
                                   :slot1FromAmPmField.text
                                   :slot1ToHourField.text
                                   :slot1ToMinuteField.text
                                   :slot1ToAmPmField.text
                                        :slot2FromHourField.text
                                        :slot2FromMinuteField.text
                                        :slot2FromAmPmField.text
                                        :slot2ToHourField.text
                                        :slot2ToMinuteField.text
                                        :slot2ToAmPmField.text]){
        NSLog(@"Sending data to next vc");
        NSString *slot1From = [NSString stringWithFormat:@"%@:%@ %@",slot1FromHourField.text,slot1FromMinuteField.text,slot1FromAmPmField.text];
        
        NSString *slot1To = [NSString stringWithFormat:@"%@:%@ %@",slot1ToHourField.text,slot1ToMinuteField.text,slot1ToAmPmField.text];
        
        NSString *slot2From = [NSString stringWithFormat:@"%@:%@ %@",slot2FromHourField.text,slot2FromMinuteField.text,slot2FromAmPmField.text];
        
        NSString *slot2To = [NSString stringWithFormat:@"%@:%@ %@",slot2ToHourField.text,slot2ToMinuteField.text,slot2ToAmPmField.text];
        
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        NSMutableArray *arr1 = [[NSMutableArray alloc]init];
        
        if (![slot1MonDay isEqualToString:@""]) {
            [arr addObject:slot1MonDay];
            
            mondaySlot1Arr = @{@"day" : slot1MonDay,
                               @"from" : slot1From,
                               @"to" : slot1To,
                               @"shift" : shift1};
            
        }
        if (![slot1TueDay isEqualToString:@""]){
            [arr addObject:slot1TueDay];
            tuesdaySlot1Arr = @{@"day" : slot1TueDay,
                                @"from" : slot1From,
                                @"to" : slot1To,
                                @"shift" : shift1};
            
        }
        if (![slot1WedDay isEqualToString:@""]){
            [arr addObject:slot1WedDay];
            wednesdaySlot1Arr = @{@"day" : slot1WedDay,
                                  @"from" : slot1From,
                                  @"to" : slot1To,
                                  @"shift" : shift1};
            
        }
        if (![slot1ThuDay isEqualToString:@""]){
            [arr addObject:slot1ThuDay];
            thursdaySlot1Arr = @{@"day" : slot1ThuDay,
                                 @"from" : slot1From,
                                 @"to" : slot1To,
                                 @"shift" : shift1};
            
        }
        if (![slot1FriDay isEqualToString:@""]){
            [arr addObject:slot1FriDay];
            fridaySlot1Arr = @{@"day" : slot1FriDay,
                               @"from" : slot1From,
                               @"to" : slot1To,
                               @"shift" : shift1};
            
        }
        if (![slot1SatDay isEqualToString:@""]){
            [arr addObject:slot1SatDay];
            saturdaySlot1Arr = @{@"day" : slot1SatDay,
                                 @"from" : slot1From,
                                 @"to" : slot1To,
                                 @"shift" : shift1};
            
        }
        if (![slot1SunDay isEqualToString:@""]){
            [arr addObject:slot1SunDay];
            sundaySlot1Arr = @{@"day" : slot1SunDay,
                               @"from" : slot1From,
                               @"to" : slot1To,
                               @"shift" : shift1};
            
        }
        //------------------------------------------------------------------------------------
        
        if (![slot2MonDay isEqualToString:@""]) {
            [arr1 addObject:slot2MonDay];
            
            mondaySlot2Arr = @{@"day" : slot2MonDay,
                               @"from" : slot2From,
                               @"to" : slot2To,
                               @"shift" : shift2};
            
        }
        if (![slot2TueDay isEqualToString:@""]){
            [arr1 addObject:slot2TueDay];
            tuesdaySlot2Arr = @{@"day" : slot2TueDay,
                                @"from" : slot2From,
                                @"to" : slot2To,
                                @"shift" : shift2};
            
        }
        if (![slot2WedDay isEqualToString:@""]){
            [arr1 addObject:slot2WedDay];
            wednesdaySlot2Arr = @{@"day" : slot2WedDay,
                                  @"from" : slot2From,
                                  @"to" : slot2To,
                                  @"shift" : shift2};
            
        }
        if (![slot2ThuDay isEqualToString:@""]){
            [arr1 addObject:slot2ThuDay];
            thursdaySlot2Arr = @{@"day" : slot2ThuDay,
                                 @"from" : slot2From,
                                 @"to" : slot2To,
                                 @"shift" : shift2};
            
        }
        if (![slot2FriDay isEqualToString:@""]){
            [arr1 addObject:slot2FriDay];
            fridaySlot2Arr = @{@"day" : slot2FriDay,
                               @"from" : slot2From,
                               @"to" : slot2To,
                               @"shift" : shift2};
            
        }
        if (![slot2SatDay isEqualToString:@""]){
            [arr1 addObject:slot2SatDay];
            saturdaySlot2Arr = @{@"day" : slot2SatDay,
                                 @"from" : slot2From,
                                 @"to" : slot2To,
                                 @"shift" : shift2};
            
        }
        if (![slot2SunDay isEqualToString:@""]){
            [arr1 addObject:slot2SunDay];
            sundaySlot2Arr = @{@"day" : slot2SunDay,
                               @"from" : slot2From,
                               @"to" : slot2To,
                               @"shift" : shift2};
            
        }

        
        NSLog(@"Total days selected.......%@",arr);
        NSLog(@"count======%lu",(unsigned long)arr.count);
        
        NSMutableArray *keys = [[NSMutableArray alloc]init];
        
        indexCount = 0;
        indexCount1 = 0;
        
        NSMutableArray *objectArr = [[NSMutableArray alloc]initWithCapacity:arr.count];
        NSMutableArray *objectArr1 = [[NSMutableArray alloc]initWithCapacity:arr1.count];
        
        
        if (![mondaySlot1Arr count] == 0) {
            [objectArr insertObject:mondaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        
        if (![tuesdaySlot1Arr count] == 0) {
            [objectArr insertObject:tuesdaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        if (![wednesdaySlot1Arr count] == 0) {
            [objectArr insertObject:wednesdaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        if (![thursdaySlot1Arr count] == 0) {
            [objectArr insertObject:thursdaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        if (![fridaySlot1Arr count] == 0) {
            [objectArr insertObject:fridaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        if (![saturdaySlot1Arr count] == 0) {
            [objectArr insertObject:saturdaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        if (![sundaySlot1Arr count] == 0) {
            [objectArr insertObject:sundaySlot1Arr atIndex:(int)indexCount/4];
        }
        /*----------------------------------------------------------------------------------------------*/
        if (![mondaySlot2Arr count] == 0) {
            [objectArr1 insertObject:mondaySlot2Arr atIndex:(int)indexCount1/4];
            indexCount1++;
        }
        
        if (![tuesdaySlot2Arr count] == 0) {
            [objectArr1 insertObject:tuesdaySlot2Arr atIndex:(int)indexCount1/4];
            indexCount1++;
        }
        if (![wednesdaySlot2Arr count] == 0) {
            [objectArr1 insertObject:wednesdaySlot2Arr atIndex:(int)indexCount1/4];
            indexCount1++;
        }
        if (![thursdaySlot2Arr count] == 0) {
            [objectArr1 insertObject:thursdaySlot2Arr atIndex:(int)indexCount1/4];
            indexCount1++;
        }
        if (![fridaySlot2Arr count] == 0) {
            [objectArr1 insertObject:fridaySlot2Arr atIndex:(int)indexCount1/4];
            indexCount1++;
        }
        if (![saturdaySlot2Arr count] == 0) {
            [objectArr1 insertObject:saturdaySlot2Arr atIndex:(int)indexCount1/4];
            indexCount1++;
        }
        if (![sundaySlot2Arr count] == 0) {
            [objectArr1 insertObject:sundaySlot2Arr atIndex:(int)indexCount1/4];
        }

        
        
        NSLog(@"objectarrrrrrrrrrrrrrr%@",objectArr);
        NSLog(@"objectarrrrrrrrrrrrrrr1111%@",objectArr1);
        
        [objectArr addObjectsFromArray:objectArr1];
        
        NSLog(@"After changeing ...........................%@",objectArr);
        
        NSLog(@"The day array............%lu",(unsigned long)arr.count);
        NSLog(@"keys%@",keys);
        
        dict = [NSDictionary dictionaryWithObject:objectArr forKey:@"schedules"];
        
        
        NSLog(@"The Slot1 data in the dictionary is************************%@",dict);
        CreateDoctorsClinicSettingsViewController *createClinic =
        [self.storyboard instantiateViewControllerWithIdentifier:@"CreateDoctorsClinicSettingsViewController"];
        createClinic.passDictionaryForSlots = dict;
        NSLog(@"is dic copied? %@",createClinic.passDictionaryForSlots);
        [self.navigationController pushViewController:createClinic animated:YES];
        
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

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/


/*++++++++++++++++++++++++++++++++++++++++++++Slot1 And Slot3++++++++++++++++++++++++++++++++++++++++++++*/
-(void)errorMessaggeSlot1Slot3CheckBox{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please select the day for slots." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}


-(BOOL)validateSlot1Slot3AllFields:(NSString *)slot1fromhr : (NSString *)slot1frommin : (NSString *)slot1fromampm :(NSString *) slot1tohr : (NSString *)slot1tomin :(NSString *)slot1toampm :(NSString *)slot3fromhr : (NSString *)slot3frommin : (NSString *)slot3fromampm :(NSString *) slot3tohr : (NSString *)slot3tomin :(NSString *)slot3toampm{
    if ([self validateSlot1FromHr:slot1fromhr]
        && [self validateSlot1FromMin:slot1frommin]
        && [self validateSlot1FromAmPm:slot1fromampm]
        && [self validateSlot1ToHr:slot1tohr]
        && [self validateSlot1ToMin:slot1tomin]
        && [self validateSlot1ToAmPm:slot1toampm]
        && [self validateSlot3FromHr:slot3fromhr]
        && [self validateSlot3FromMin:slot3frommin]
        && [self validateSlot3FromAmPm:slot3fromampm]
        && [self validateSlot3ToHr:slot3tohr]
        && [self validateSlot3ToMin:slot3tomin]
        && [self validateSlot3ToAmPm:slot3toampm]) {
        return 1;
    }
    else{
        return 0;
    }
    
}

-(void)callValidateSlot1Slot3AllFields{
    
    if([self validateSlot1Slot3AllFields:slot1FromHourField.text
                                        :slot1FromMinuteField.text
                                        :slot1FromAmPmField.text
                                        :slot1ToHourField.text
                                        :slot1ToMinuteField.text
                                        :slot1ToAmPmField.text
                                        :slot3FromHourField.text
                                        :slot3FromMinuteField.text
                                        :slot3FromAmPmField.text
                                        :slot3ToHourField.text
                                        :slot3ToMinuteField.text
                                        :slot3ToAmPmField.text]){
        NSLog(@"Sending data to next vc");
        NSString *slot1From = [NSString stringWithFormat:@"%@:%@ %@",slot1FromHourField.text,slot1FromMinuteField.text,slot1FromAmPmField.text];
        
        NSString *slot1To = [NSString stringWithFormat:@"%@:%@ %@",slot1ToHourField.text,slot1ToMinuteField.text,slot1ToAmPmField.text];
        
        NSString *slot3From = [NSString stringWithFormat:@"%@:%@ %@",slot3FromHourField.text,slot3FromMinuteField.text,slot3FromAmPmField.text];
        
        NSString *slot3To = [NSString stringWithFormat:@"%@:%@ %@",slot3ToHourField.text,slot3ToMinuteField.text,slot3ToAmPmField.text];
        
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        NSMutableArray *arr1 = [[NSMutableArray alloc]init];
        
        if (![slot1MonDay isEqualToString:@""]) {
            [arr addObject:slot1MonDay];
            
            mondaySlot1Arr = @{@"day" : slot1MonDay,
                               @"from" : slot1From,
                               @"to" : slot1To,
                               @"shift" : shift1};
            
        }
        if (![slot1TueDay isEqualToString:@""]){
            [arr addObject:slot1TueDay];
            tuesdaySlot1Arr = @{@"day" : slot1TueDay,
                                @"from" : slot1From,
                                @"to" : slot1To,
                                @"shift" : shift1};
            
        }
        if (![slot1WedDay isEqualToString:@""]){
            [arr addObject:slot1WedDay];
            wednesdaySlot1Arr = @{@"day" : slot1WedDay,
                                  @"from" : slot1From,
                                  @"to" : slot1To,
                                  @"shift" : shift1};
            
        }
        if (![slot1ThuDay isEqualToString:@""]){
            [arr addObject:slot1ThuDay];
            thursdaySlot1Arr = @{@"day" : slot1ThuDay,
                                 @"from" : slot1From,
                                 @"to" : slot1To,
                                 @"shift" : shift1};
            
        }
        if (![slot1FriDay isEqualToString:@""]){
            [arr addObject:slot1FriDay];
            fridaySlot1Arr = @{@"day" : slot1FriDay,
                               @"from" : slot1From,
                               @"to" : slot1To,
                               @"shift" : shift1};
            
        }
        if (![slot1SatDay isEqualToString:@""]){
            [arr addObject:slot1SatDay];
            saturdaySlot1Arr = @{@"day" : slot1SatDay,
                                 @"from" : slot1From,
                                 @"to" : slot1To,
                                 @"shift" : shift1};
            
        }
        if (![slot1SunDay isEqualToString:@""]){
            [arr addObject:slot1SunDay];
            sundaySlot1Arr = @{@"day" : slot1SunDay,
                               @"from" : slot1From,
                               @"to" : slot1To,
                               @"shift" : shift1};
            
        }
        //------------------------------------------------------------------------------------
        
        if (![slot3MonDay isEqualToString:@""]) {
            [arr1 addObject:slot3MonDay];
            
            mondaySlot3Arr = @{@"day" : slot3MonDay,
                               @"from" : slot3From,
                               @"to" : slot3To,
                               @"shift" : shift3};
            
        }
        if (![slot3TueDay isEqualToString:@""]){
            [arr1 addObject:slot3TueDay];
            tuesdaySlot3Arr = @{@"day" : slot3TueDay,
                                @"from" : slot3From,
                                @"to" : slot3To,
                                @"shift" : shift3};
            
        }
        if (![slot3WedDay isEqualToString:@""]){
            [arr1 addObject:slot3WedDay];
            wednesdaySlot3Arr = @{@"day" : slot3WedDay,
                                  @"from" : slot3From,
                                  @"to" : slot3To,
                                  @"shift" : shift3};
            
        }
        if (![slot3ThuDay isEqualToString:@""]){
            [arr1 addObject:slot3ThuDay];
            thursdaySlot3Arr = @{@"day" : slot3ThuDay,
                                 @"from" : slot3From,
                                 @"to" : slot3To,
                                 @"shift" : shift3};
            
        }
        if (![slot3FriDay isEqualToString:@""]){
            [arr1 addObject:slot3FriDay];
            fridaySlot3Arr = @{@"day" : slot3FriDay,
                               @"from" : slot3From,
                               @"to" : slot3To,
                               @"shift" : shift3};
            
        }
        if (![slot3SatDay isEqualToString:@""]){
            [arr1 addObject:slot3SatDay];
            saturdaySlot3Arr = @{@"day" : slot3SatDay,
                                 @"from" : slot3From,
                                 @"to" : slot3To,
                                 @"shift" : shift3};
            
        }
        if (![slot3SunDay isEqualToString:@""]){
            [arr1 addObject:slot3SunDay];
            sundaySlot3Arr = @{@"day" : slot3SunDay,
                               @"from" : slot3From,
                               @"to" : slot3To,
                               @"shift" : shift3};
            
        }
        
        
        NSLog(@"Total days selected.......%@",arr);
        NSLog(@"count======%lu",(unsigned long)arr.count);
        
        NSMutableArray *keys = [[NSMutableArray alloc]init];
        
        indexCount = 0;
        indexCount2 = 0;
        
        NSMutableArray *objectArr = [[NSMutableArray alloc]initWithCapacity:arr.count];
        NSMutableArray *objectArr1 = [[NSMutableArray alloc]initWithCapacity:arr1.count];
        
        
        if (![mondaySlot1Arr count] == 0) {
            [objectArr insertObject:mondaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        
        if (![tuesdaySlot1Arr count] == 0) {
            [objectArr insertObject:tuesdaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        if (![wednesdaySlot1Arr count] == 0) {
            [objectArr insertObject:wednesdaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        if (![thursdaySlot1Arr count] == 0) {
            [objectArr insertObject:thursdaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        if (![fridaySlot1Arr count] == 0) {
            [objectArr insertObject:fridaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        if (![saturdaySlot1Arr count] == 0) {
            [objectArr insertObject:saturdaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        if (![sundaySlot1Arr count] == 0) {
            [objectArr insertObject:sundaySlot1Arr atIndex:(int)indexCount/4];
        }
        /*----------------------------------------------------------------------------------------------*/
        if (![mondaySlot3Arr count] == 0) {
            [objectArr1 insertObject:mondaySlot3Arr atIndex:(int)indexCount2/4];
            indexCount2++;
        }
        
        if (![tuesdaySlot3Arr count] == 0) {
            [objectArr1 insertObject:tuesdaySlot3Arr atIndex:(int)indexCount2/4];
            indexCount2++;
        }
        if (![wednesdaySlot3Arr count] == 0) {
            [objectArr1 insertObject:wednesdaySlot3Arr atIndex:(int)indexCount2/4];
            indexCount2++;
        }
        if (![thursdaySlot3Arr count] == 0) {
            [objectArr1 insertObject:thursdaySlot3Arr atIndex:(int)indexCount2/4];
            indexCount2++;
        }
        if (![fridaySlot3Arr count] == 0) {
            [objectArr1 insertObject:fridaySlot3Arr atIndex:(int)indexCount2/4];
            indexCount2++;
        }
        if (![saturdaySlot3Arr count] == 0) {
            [objectArr1 insertObject:saturdaySlot3Arr atIndex:(int)indexCount2/4];
            indexCount2++;
        }
        if (![sundaySlot3Arr count] == 0) {
            [objectArr1 insertObject:sundaySlot3Arr atIndex:(int)indexCount2/4];
        }
        
        
        
        NSLog(@"objectarrrrrrrrrrrrrrr%@",objectArr);
        NSLog(@"objectarrrrrrrrrrrrrrr1111%@",objectArr1);
        
        [objectArr addObjectsFromArray:objectArr1];
        
        NSLog(@"After changeing ...........................%@",objectArr);
        
        NSLog(@"The day array............%lu",(unsigned long)arr.count);
        NSLog(@"keys%@",keys);
        
        dict = [NSDictionary dictionaryWithObject:objectArr forKey:@"schedules"];
        
        
        NSLog(@"The Slot1 data in the dictionary is************************%@",dict);
        CreateDoctorsClinicSettingsViewController *createClinic =
        [self.storyboard instantiateViewControllerWithIdentifier:@"CreateDoctorsClinicSettingsViewController"];
        createClinic.passDictionaryForSlots = dict;
        NSLog(@"is dic copied? %@",createClinic.passDictionaryForSlots);
        [self.navigationController pushViewController:createClinic animated:YES];
        
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

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

/*+++++++++++++++++++++++++++++++++++++Slot1 And Slot2 And Slot3++++++++++++++++++++++++++++++++++++++++*/
-(void)errorMessaggeSlot1Slot2Slot3CheckBox{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please select the day for slots." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}


-(BOOL)validateSlot1Slot2Slot3AllFields:(NSString *)slot1fromhr : (NSString *)slot1frommin : (NSString *)slot1fromampm :(NSString *) slot1tohr : (NSString *)slot1tomin :(NSString *)slot1toampm :(NSString *)slot2fromhr : (NSString *)slot2frommin : (NSString *)slot2fromampm :(NSString *) slot2tohr : (NSString *)slot2tomin :(NSString *)slot2toampm :(NSString *)slot3fromhr : (NSString *)slot3frommin : (NSString *)slot3fromampm :(NSString *) slot3tohr : (NSString *)slot3tomin :(NSString *)slot3toampm{
    if ([self validateSlot1FromHr:slot1fromhr]
        && [self validateSlot1FromMin:slot1frommin]
        && [self validateSlot1FromAmPm:slot1fromampm]
        && [self validateSlot1ToHr:slot1tohr]
        && [self validateSlot1ToMin:slot1tomin]
        && [self validateSlot1ToAmPm:slot1toampm]
        
        && [self validateSlot2FromHr:slot2fromhr]
        && [self validateSlot2FromMin:slot2frommin]
        && [self validateSlot2FromAmPm:slot2fromampm]
        && [self validateSlot2ToHr:slot2tohr]
        && [self validateSlot2ToMin:slot2tomin]
        && [self validateSlot2ToAmPm:slot2toampm]
        
        && [self validateSlot3FromHr:slot3fromhr]
        && [self validateSlot3FromMin:slot3frommin]
        && [self validateSlot3FromAmPm:slot3fromampm]
        && [self validateSlot3ToHr:slot3tohr]
        && [self validateSlot3ToMin:slot3tomin]
        && [self validateSlot3ToAmPm:slot3toampm]) {
        return 1;
    }
    else{
        return 0;
    }
    
}

-(void)callValidateSlot1Slot2Slot3AllFields{
    
    if([self validateSlot1Slot2Slot3AllFields:slot1FromHourField.text
                                        :slot1FromMinuteField.text
                                        :slot1FromAmPmField.text
                                        :slot1ToHourField.text
                                        :slot1ToMinuteField.text
                                        :slot1ToAmPmField.text
                                        :slot2FromHourField.text
                                        :slot2FromMinuteField.text
                                        :slot2FromAmPmField.text
                                        :slot2ToHourField.text
                                        :slot2ToMinuteField.text
                                        :slot2ToAmPmField.text
                                             :slot3FromHourField.text
                                             :slot3FromMinuteField.text
                                             :slot3FromAmPmField.text
                                             :slot3ToHourField.text
                                             :slot3ToMinuteField.text
                                             :slot3ToAmPmField.text]){
        NSLog(@"Sending data to next vc");
        NSString *slot1From = [NSString stringWithFormat:@"%@:%@ %@",slot1FromHourField.text,slot1FromMinuteField.text,slot1FromAmPmField.text];
        
        NSString *slot1To = [NSString stringWithFormat:@"%@:%@ %@",slot1ToHourField.text,slot1ToMinuteField.text,slot1ToAmPmField.text];
        
        NSString *slot2From = [NSString stringWithFormat:@"%@:%@ %@",slot2FromHourField.text,slot2FromMinuteField.text,slot2FromAmPmField.text];
        
        NSString *slot2To = [NSString stringWithFormat:@"%@:%@ %@",slot2ToHourField.text,slot2ToMinuteField.text,slot2ToAmPmField.text];
       
        NSString *slot3From = [NSString stringWithFormat:@"%@:%@ %@",slot3FromHourField.text,slot3FromMinuteField.text,slot3FromAmPmField.text];
        
        NSString *slot3To = [NSString stringWithFormat:@"%@:%@ %@",slot3ToHourField.text,slot3ToMinuteField.text,slot3ToAmPmField.text];
        
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        NSMutableArray *arr1 = [[NSMutableArray alloc]init];
        NSMutableArray *arr2 = [[NSMutableArray alloc]init];
        
        if (![slot1MonDay isEqualToString:@""]) {
            [arr addObject:slot1MonDay];
            
            mondaySlot1Arr = @{@"day" : slot1MonDay,
                               @"from" : slot1From,
                               @"to" : slot1To,
                               @"shift" : shift1};
            
        }
        if (![slot1TueDay isEqualToString:@""]){
            [arr addObject:slot1TueDay];
            tuesdaySlot1Arr = @{@"day" : slot1TueDay,
                                @"from" : slot1From,
                                @"to" : slot1To,
                                @"shift" : shift1};
            
        }
        if (![slot1WedDay isEqualToString:@""]){
            [arr addObject:slot1WedDay];
            wednesdaySlot1Arr = @{@"day" : slot1WedDay,
                                  @"from" : slot1From,
                                  @"to" : slot1To,
                                  @"shift" : shift1};
            
        }
        if (![slot1ThuDay isEqualToString:@""]){
            [arr addObject:slot1ThuDay];
            thursdaySlot1Arr = @{@"day" : slot1ThuDay,
                                 @"from" : slot1From,
                                 @"to" : slot1To,
                                 @"shift" : shift1};
            
        }
        if (![slot1FriDay isEqualToString:@""]){
            [arr addObject:slot1FriDay];
            fridaySlot1Arr = @{@"day" : slot1FriDay,
                               @"from" : slot1From,
                               @"to" : slot1To,
                               @"shift" : shift1};
            
        }
        if (![slot1SatDay isEqualToString:@""]){
            [arr addObject:slot1SatDay];
            saturdaySlot1Arr = @{@"day" : slot1SatDay,
                                 @"from" : slot1From,
                                 @"to" : slot1To,
                                 @"shift" : shift1};
            
        }
        if (![slot1SunDay isEqualToString:@""]){
            [arr addObject:slot1SunDay];
            sundaySlot1Arr = @{@"day" : slot1SunDay,
                               @"from" : slot1From,
                               @"to" : slot1To,
                               @"shift" : shift1};
            
        }
        //------------------------------------------------------------------------------------
        
        if (![slot2MonDay isEqualToString:@""]) {
            [arr1 addObject:slot2MonDay];
            
            mondaySlot2Arr = @{@"day" : slot2MonDay,
                               @"from" : slot2From,
                               @"to" : slot2To,
                               @"shift" : shift2};
            
        }
        if (![slot2TueDay isEqualToString:@""]){
            [arr1 addObject:slot2TueDay];
            tuesdaySlot2Arr = @{@"day" : slot2TueDay,
                                @"from" : slot2From,
                                @"to" : slot2To,
                                @"shift" : shift2};
            
        }
        if (![slot2WedDay isEqualToString:@""]){
            [arr1 addObject:slot2WedDay];
            wednesdaySlot2Arr = @{@"day" : slot2WedDay,
                                  @"from" : slot2From,
                                  @"to" : slot2To,
                                  @"shift" : shift2};
            
        }
        if (![slot2ThuDay isEqualToString:@""]){
            [arr1 addObject:slot2ThuDay];
            thursdaySlot2Arr = @{@"day" : slot2ThuDay,
                                 @"from" : slot2From,
                                 @"to" : slot2To,
                                 @"shift" : shift2};
            
        }
        if (![slot2FriDay isEqualToString:@""]){
            [arr1 addObject:slot2FriDay];
            fridaySlot2Arr = @{@"day" : slot2FriDay,
                               @"from" : slot2From,
                               @"to" : slot2To,
                               @"shift" : shift2};
            
        }
        if (![slot2SatDay isEqualToString:@""]){
            [arr1 addObject:slot2SatDay];
            saturdaySlot2Arr = @{@"day" : slot2SatDay,
                                 @"from" : slot2From,
                                 @"to" : slot2To,
                                 @"shift" : shift2};
            
        }
        if (![slot2SunDay isEqualToString:@""]){
            [arr1 addObject:slot2SunDay];
            sundaySlot2Arr = @{@"day" : slot2SunDay,
                               @"from" : slot2From,
                               @"to" : slot2To,
                               @"shift" : shift2};
            
        }
        
        //------------------------------------------------------------------------------------
        
        if (![slot3MonDay isEqualToString:@""]) {
            [arr2 addObject:slot3MonDay];
            
            mondaySlot3Arr = @{@"day" : slot3MonDay,
                               @"from" : slot3From,
                               @"to" : slot3To,
                               @"shift" : shift3};
            
        }
        if (![slot3TueDay isEqualToString:@""]){
            [arr2 addObject:slot3TueDay];
            tuesdaySlot3Arr = @{@"day" : slot3TueDay,
                                @"from" : slot3From,
                                @"to" : slot3To,
                                @"shift" : shift3};
            
        }
        if (![slot3WedDay isEqualToString:@""]){
            [arr2 addObject:slot3WedDay];
            wednesdaySlot3Arr = @{@"day" : slot3WedDay,
                                  @"from" : slot3From,
                                  @"to" : slot3To,
                                  @"shift" : shift3};
            
        }
        if (![slot3ThuDay isEqualToString:@""]){
            [arr2 addObject:slot3ThuDay];
            thursdaySlot3Arr = @{@"day" : slot3ThuDay,
                                 @"from" : slot3From,
                                 @"to" : slot3To,
                                 @"shift" : shift3};
            
        }
        if (![slot3FriDay isEqualToString:@""]){
            [arr2 addObject:slot3FriDay];
            fridaySlot3Arr = @{@"day" : slot3FriDay,
                               @"from" : slot3From,
                               @"to" : slot3To,
                               @"shift" : shift3};
            
        }
        if (![slot3SatDay isEqualToString:@""]){
            [arr2 addObject:slot3SatDay];
            saturdaySlot3Arr = @{@"day" : slot3SatDay,
                                 @"from" : slot3From,
                                 @"to" : slot3To,
                                 @"shift" : shift3};
            
        }
        if (![slot3SunDay isEqualToString:@""]){
            [arr2 addObject:slot3SunDay];
            sundaySlot3Arr = @{@"day" : slot3SunDay,
                               @"from" : slot3From,
                               @"to" : slot3To,
                               @"shift" : shift3};
            
        }

        
        
        NSLog(@"Total days selected.......%@",arr);
        NSLog(@"count======%lu",(unsigned long)arr.count);
        
        NSMutableArray *keys = [[NSMutableArray alloc]init];
        
        indexCount = 0;
        indexCount1 = 0;
        indexCount2 = 0;
        
        NSMutableArray *objectArr = [[NSMutableArray alloc]initWithCapacity:arr.count];
        NSMutableArray *objectArr1 = [[NSMutableArray alloc]initWithCapacity:arr1.count];
        NSMutableArray *objectArr2 = [[NSMutableArray alloc]initWithCapacity:arr2.count];
        
        if (![mondaySlot1Arr count] == 0) {
            [objectArr insertObject:mondaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        
        if (![tuesdaySlot1Arr count] == 0) {
            [objectArr insertObject:tuesdaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        if (![wednesdaySlot1Arr count] == 0) {
            [objectArr insertObject:wednesdaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        if (![thursdaySlot1Arr count] == 0) {
            [objectArr insertObject:thursdaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        if (![fridaySlot1Arr count] == 0) {
            [objectArr insertObject:fridaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        if (![saturdaySlot1Arr count] == 0) {
            [objectArr insertObject:saturdaySlot1Arr atIndex:(int)indexCount/4];
            indexCount++;
        }
        if (![sundaySlot1Arr count] == 0) {
            [objectArr insertObject:sundaySlot1Arr atIndex:(int)indexCount/4];
        }
        /*----------------------------------------------------------------------------------------------*/
        if (![mondaySlot2Arr count] == 0) {
            [objectArr1 insertObject:mondaySlot2Arr atIndex:(int)indexCount1/4];
            indexCount1++;
        }
        
        if (![tuesdaySlot2Arr count] == 0) {
            [objectArr1 insertObject:tuesdaySlot2Arr atIndex:(int)indexCount1/4];
            indexCount1++;
        }
        if (![wednesdaySlot2Arr count] == 0) {
            [objectArr1 insertObject:wednesdaySlot2Arr atIndex:(int)indexCount1/4];
            indexCount1++;
        }
        if (![thursdaySlot2Arr count] == 0) {
            [objectArr1 insertObject:thursdaySlot2Arr atIndex:(int)indexCount1/4];
            indexCount1++;
        }
        if (![fridaySlot2Arr count] == 0) {
            [objectArr1 insertObject:fridaySlot2Arr atIndex:(int)indexCount1/4];
            indexCount1++;
        }
        if (![saturdaySlot2Arr count] == 0) {
            [objectArr1 insertObject:saturdaySlot2Arr atIndex:(int)indexCount1/4];
            indexCount1++;
        }
        if (![sundaySlot2Arr count] == 0) {
            [objectArr1 insertObject:sundaySlot2Arr atIndex:(int)indexCount1/4];
        }
        
        /*----------------------------------------------------------------------------------------------*/
        if (![mondaySlot3Arr count] == 0) {
            [objectArr2 insertObject:mondaySlot3Arr atIndex:(int)indexCount2/4];
            indexCount2++;
        }
        
        if (![tuesdaySlot3Arr count] == 0) {
            [objectArr2 insertObject:tuesdaySlot3Arr atIndex:(int)indexCount2/4];
            indexCount2++;
        }
        if (![wednesdaySlot3Arr count] == 0) {
            [objectArr2 insertObject:wednesdaySlot3Arr atIndex:(int)indexCount2/4];
            indexCount2++;
        }
        if (![thursdaySlot3Arr count] == 0) {
            [objectArr2 insertObject:thursdaySlot3Arr atIndex:(int)indexCount2/4];
            indexCount2++;
        }
        if (![fridaySlot3Arr count] == 0) {
            [objectArr2 insertObject:fridaySlot3Arr atIndex:(int)indexCount2/4];
            indexCount2++;
        }
        if (![saturdaySlot3Arr count] == 0) {
            [objectArr2 insertObject:saturdaySlot3Arr atIndex:(int)indexCount2/4];
            indexCount2++;
        }
        if (![sundaySlot3Arr count] == 0) {
            [objectArr2 insertObject:sundaySlot3Arr atIndex:(int)indexCount2/4];
        }
        

        
        
        NSLog(@"objectarrrrrrrrrrrrrrr%@",objectArr);
        NSLog(@"objectarrrrrrrrrrrrrrr1111%@",objectArr1);
        
        [objectArr addObjectsFromArray:objectArr1];
        [objectArr addObjectsFromArray:objectArr2];
        
        NSLog(@"After changeing ...........................%@",objectArr);
        
        NSLog(@"The day array............%lu",(unsigned long)arr.count);
        NSLog(@"keys%@",keys);
        
        dict = [NSDictionary dictionaryWithObject:objectArr forKey:@"schedules"];
        
        
        NSLog(@"The Slot1 data in the dictionary is************************%@",dict);
        CreateDoctorsClinicSettingsViewController *createClinic =
        [self.storyboard instantiateViewControllerWithIdentifier:@"CreateDoctorsClinicSettingsViewController"];
        createClinic.passDictionaryForSlots = dict;
        NSLog(@"is dic copied? %@",createClinic.passDictionaryForSlots);
        [self.navigationController pushViewController:createClinic animated:YES];
        
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

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/



- (IBAction)done:(id)sender {
    
    if (slot1ContentView.hidden == FALSE && slot2ContentView.hidden == FALSE && slot3ContentView.hidden == FALSE) {
        
        NSLog(@"All the shifts are shown....");
        shift1 = @"shift1";
        shift2 = @"shift2";
        shift3 = @"shift3";
        if ([slot1FromHourField.text isEqualToString:@""]
            && [slot1FromMinuteField.text isEqualToString:@""]
            && [slot1FromAmPmField.text isEqualToString:@""]
            && [slot1ToHourField.text isEqualToString:@""]
            && [slot1ToMinuteField.text isEqualToString:@""]
            && [slot1ToAmPmField.text isEqualToString:@""]
            
            &&[slot2FromHourField.text isEqualToString:@""]
            && [slot2FromMinuteField.text isEqualToString:@""]
            && [slot2FromAmPmField.text isEqualToString:@""]
            && [slot2ToHourField.text isEqualToString:@""]
            && [slot2ToMinuteField.text isEqualToString:@""]
            && [slot2ToAmPmField.text isEqualToString:@""]
            
            &&[slot3FromHourField.text isEqualToString:@""]
            && [slot3FromMinuteField.text isEqualToString:@""]
            && [slot3FromAmPmField.text isEqualToString:@""]
            && [slot3ToHourField.text isEqualToString:@""]
            && [slot3ToMinuteField.text isEqualToString:@""]
            && [slot3ToAmPmField.text isEqualToString:@""]) {
            NSLog(@"All Empty");
            [self errorAllFieldsMandatory];
        }
        else{
            if ((slot1MonBool || slot1TueBool || slot1WedBool || slot1ThuBool || slot1FriBool || slot1SatBool || slot1SunBool || slot1SelectAllBool) && (slot2MonBool || slot2TueBool || slot2WedBool || slot2ThuBool || slot2FriBool || slot2SatBool || slot2SunBool || slot2SelectAllBool) && (slot3MonBool || slot3TueBool || slot3WedBool || slot3ThuBool || slot3FriBool || slot3SatBool || slot3SunBool || slot3SelectAllBool)) {
                NSLog(@"Checked and calling func");
                [self callValidateSlot1Slot2Slot3AllFields];
            }
            else{
                NSLog(@"Check button");
                [self errorMessaggeSlot1Slot2Slot3CheckBox];
            }
        }
        

        
    }
    else if (slot1ContentView.hidden == FALSE && slot2ContentView.hidden == FALSE && slot3ContentView.hidden == TRUE){
        NSLog(@"Slot1 and Slot2 shown....");
        shift1 = @"shift1";
        shift2 = @"shift2";
        if ([slot1FromHourField.text isEqualToString:@""]
            && [slot1FromMinuteField.text isEqualToString:@""]
            && [slot1FromAmPmField.text isEqualToString:@""]
            && [slot1ToHourField.text isEqualToString:@""]
            && [slot1ToMinuteField.text isEqualToString:@""]
            && [slot1ToAmPmField.text isEqualToString:@""]
            
            &&[slot2FromHourField.text isEqualToString:@""]
            && [slot2FromMinuteField.text isEqualToString:@""]
            && [slot2FromAmPmField.text isEqualToString:@""]
            && [slot2ToHourField.text isEqualToString:@""]
            && [slot2ToMinuteField.text isEqualToString:@""]
            && [slot2ToAmPmField.text isEqualToString:@""]) {
            NSLog(@"All Empty");
            [self errorAllFieldsMandatory];
        }
        else{
            if ((slot1MonBool || slot1TueBool || slot1WedBool || slot1ThuBool || slot1FriBool || slot1SatBool || slot1SunBool || slot1SelectAllBool) && (slot2MonBool || slot2TueBool || slot2WedBool || slot2ThuBool || slot2FriBool || slot2SatBool || slot2SunBool || slot2SelectAllBool)) {
                NSLog(@"Checked and calling func");
                [self callValidateSlot1Slot2AllFields];
            }
            else{
                NSLog(@"Check button");
                [self errorMessaggeSlot1Slot2CheckBox];
            }
        }

        
    }
    else if (slot1ContentView.hidden == FALSE && slot2ContentView.hidden == TRUE && slot3ContentView.hidden == FALSE){
        NSLog(@"Slot1 and slot3 shown....");
        shift1 = @"shift1";
        shift3 = @"shift3";
        if ([slot1FromHourField.text isEqualToString:@""]
            && [slot1FromMinuteField.text isEqualToString:@""]
            && [slot1FromAmPmField.text isEqualToString:@""]
            && [slot1ToHourField.text isEqualToString:@""]
            && [slot1ToMinuteField.text isEqualToString:@""]
            && [slot1ToAmPmField.text isEqualToString:@""]
            
            &&[slot3FromHourField.text isEqualToString:@""]
            && [slot3FromMinuteField.text isEqualToString:@""]
            && [slot3FromAmPmField.text isEqualToString:@""]
            && [slot3ToHourField.text isEqualToString:@""]
            && [slot3ToMinuteField.text isEqualToString:@""]
            && [slot3ToAmPmField.text isEqualToString:@""]) {
            NSLog(@"All Empty");
            [self errorAllFieldsMandatory];
        }
        else{
            if ((slot1MonBool || slot1TueBool || slot1WedBool || slot1ThuBool || slot1FriBool || slot1SatBool || slot1SunBool || slot1SelectAllBool) && (slot3MonBool || slot3TueBool || slot3WedBool || slot3ThuBool || slot3FriBool || slot3SatBool || slot3SunBool || slot3SelectAllBool)) {
                NSLog(@"Checked and calling func");
                [self callValidateSlot1Slot3AllFields];
            }
            else{
                NSLog(@"Check button");
                [self errorMessaggeSlot1Slot3CheckBox];
            }
        }

        
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
            if (slot1MonBool || slot1TueBool || slot1WedBool || slot1ThuBool || slot1FriBool || slot1SatBool || slot1SunBool || slot1SelectAllBool) {
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
        slot2MonDay =@"Mon";
    }
    else if(slot2MonBool){
        [slot2MonButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot2MonBool = NO;
        slot2MonDay =@"";
    }
    
}
- (IBAction)slot2Tue:(id)sender{
    if(!slot2TueBool){
        [slot2TueButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot2TueBool = YES;
        slot2TueDay =@"Tue";
    }
    else if(slot2TueBool){
        [slot2TueButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot2TueBool = NO;
        slot2TueDay =@"";
        
    }
    
}
- (IBAction)slot2Wed:(id)sender{
    if(!slot2WedBool){
        [slot2WedButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot2WedBool = YES;
        slot2WedDay =@"Wed";
    }
    else if(slot2WedBool){
        [slot2WedButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot2WedBool = NO;
        slot2WedDay =@"";
    }
    
}
- (IBAction)slot2Thu:(id)sender{
    
    if(!slot2ThuBool){
        [slot2ThuButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot2ThuBool = YES;
        slot2ThuDay =@"Thu";
    }
    else if(slot2ThuBool){
        [slot2ThuButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot2ThuBool = NO;
        slot2ThuDay =@"";
    }
}
- (IBAction)slot2Fri:(id)sender{
    if(!slot2FriBool){
        [slot2FriButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot2FriBool = YES;
        slot2FriDay =@"Fri";
    }
    else if(slot2FriBool){
        [slot2FriButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot2FriBool = NO;
        slot2FriDay =@"";
    }
    
}
- (IBAction)slot2Sat:(id)sender{
    if(!slot2SatBool){
        [slot2SatButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot2SatBool = YES;
        slot2SatDay =@"Sat";
    }
    else if(slot2SatBool){
        [slot2SatButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot2SatBool = NO;
        slot2SatDay =@"";
    }
}
- (IBAction)slot2Sun:(id)sender{
    if(!slot2SunBool){
        [slot2SunButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot2SunBool = YES;
        slot2SunDay =@"Sun";
    }
    else if(slot2SunBool){
        [slot2SunButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot2SunBool = NO;
        slot2SunDay =@"";
    }
}


- (IBAction)slot3Mon:(id)sender{
    if(!slot3MonBool){
        [slot3MonButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot3MonBool = YES;
        slot3MonDay =@"Mon";
    }
    else if(slot3MonBool){
        [slot3MonButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot3MonBool = NO;
        slot3MonDay =@"";
        
    }
}
- (IBAction)slot3Tue:(id)sender{
    if(!slot3TueBool){
        [slot3TueButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot3TueBool = YES;
        slot3TueDay =@"Tue";
    }
    else if(slot3TueBool){
        [slot3TueButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot3TueBool = NO;
        slot3TueDay =@"";
        
    }
}
- (IBAction)slot3Wed:(id)sender{
    if(!slot3WedBool){
        [slot3WedButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot3WedBool = YES;
        slot3WedDay =@"Wed";
    }
    else if(slot3WedBool){
        [slot3WedButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot3WedBool = NO;
        slot3WedDay =@"";
    }
}
- (IBAction)slot3Thu:(id)sender{
    if(!slot3ThuBool){
        [slot3ThuButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot3ThuBool = YES;
        slot3ThuDay =@"Thu";
    }
    else if(slot3ThuBool){
        [slot3ThuButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot3ThuBool = NO;
        slot3ThuDay =@"";
    }
    
}
- (IBAction)slot3Fri:(id)sender{
    if(!slot3FriBool){
        [slot3FriButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot3FriBool = YES;
        slot3FriDay =@"Fri";
    }
    else if(slot3FriBool){
        [slot3FriButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot3FriBool = NO;
        slot3FriDay =@"";
    }
    
}
- (IBAction)slot3Sat:(id)sender{
    if(!slot3SatBool){
        [slot3SatButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot3SatBool = YES;
        slot3SatDay =@"Sat";
    }
    else if(slot3SatBool){
        [slot3SatButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot3SatBool = NO;
        slot3SatDay =@"";
    }
}
- (IBAction)slot3Sun:(id)sender{
    if(!slot3SunBool){
        [slot3SunButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        slot3SunBool = YES;
        slot3SunDay =@"Sun";
    }
    else if(slot3SunBool){
        [slot3SunButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        slot3SunBool = NO;
        slot3SunDay =@"";
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
        slot1MonDay = @"Mon";
        slot1TueDay = @"Tue";
        slot1WedDay = @"Wed";
        slot1ThuDay = @"Thu";
        slot1FriDay = @"Fri";
        slot1SatDay = @"Sat";
        slot1SunDay = @"Sun";
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
        slot1MonDay = @"";
        slot1TueDay = @"";
        slot1WedDay = @"";
        slot1ThuDay = @"";
        slot1FriDay = @"";
        slot1SatDay = @"";
        slot1SunDay = @"";
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
        slot2MonDay = @"Mon";
        slot2TueDay = @"Tue";
        slot2WedDay = @"Wed";
        slot2ThuDay = @"Thu";
        slot2FriDay = @"Fri";
        slot2SatDay = @"Sat";
        slot2SunDay = @"Sun";

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
        slot2MonDay = @"";
        slot2TueDay = @"";
        slot2WedDay = @"";
        slot2ThuDay = @"";
        slot2FriDay = @"";
        slot2SatDay = @"";
        slot2SunDay = @"";

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
        slot3MonDay = @"Mon";
        slot3TueDay = @"Tue";
        slot3WedDay = @"Wed";
        slot3ThuDay = @"Thu";
        slot3FriDay = @"Fri";
        slot3SatDay = @"Sat";
        slot3SunDay = @"Sun";
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
        slot3MonDay = @"";
        slot3TueDay = @"";
        slot3WedDay = @"";
        slot3ThuDay = @"";
        slot3FriDay = @"";
        slot3SatDay = @"";
        slot3SunDay = @"";
    }
    
}

@end
