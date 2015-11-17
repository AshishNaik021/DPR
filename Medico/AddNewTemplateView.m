//
//  AddNewTemplateView.m
//  Medico
//
//  Created by APPLE on 06/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "AddNewTemplateView.h"
#import "TemplateDetailView.h"

@interface AddNewTemplateView ()

@end

@implementation AddNewTemplateView
@synthesize passTemplateId = _passTemplateId;
@synthesize systemNameField;
@synthesize typeField;
@synthesize displayNameField;
@synthesize defaultValueField;
@synthesize dict;
@synthesize returnString;

- (void)viewDidLoad {
    NSLog(@"AddNewTemplateView.m");
    [super viewDidLoad];
    
    NSLog(@"pass ID=%@",_passTemplateId);
    self.navigationItem.title = @"Add New Fields";
    self.navigationItem.backBarButtonItem.title = @"Back";

    // Do any additional setup after loading the view.
}

- (IBAction)addFields:(id)sender {
    
    if ([displayNameField.text isEqualToString:@""]
        && [systemNameField.text isEqualToString:@""]
        && [typeField.text isEqualToString:@""]
        && [defaultValueField.text isEqualToString:@""]) {
        NSLog(@"All Empty");
        [self errorAllFieldsMandatory];
    }
    else{
            NSLog(@"Checked and calling func");
            [self callValidateAllFields];
        }

}

-(void)errorAllFieldsMandatory{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"All fields are mandatory." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(void)errorMessageDisplayNameNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid display name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateDisplayName:(NSString *) name{
    
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:name]){
        [self errorMessageDisplayNameNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageSystemNameNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid System name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSystemName:(NSString *) name{
    
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:name]){
        [self errorMessageSystemNameNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageTypeNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Type." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateType:(NSString *) name{
    
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:name]){
        [self errorMessageTypeNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageDefaultValueNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid default value." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateDefaultValue:(NSString *) name{
    
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:name]){
        [self errorMessageDefaultValueNotValid];
        return 0;
    }
    else
        return 1;
}


-(BOOL)validateAllFields:(NSString *)systemName : (NSString *)displayName : (NSString *) type : (NSString *)defaultValue{
    if ([self validateDisplayName:displayName]
        && [self validateSystemName:systemName]
        && [self validateType:type]
        && [self validateDefaultValue:defaultValue]) {
        return 1;
    }
    else{
        return 0;
    }
    
}

-(void)callValidateAllFields{
    
    if([self validateAllFields:displayNameField.text
                              :systemNameField.text
                              :typeField.text
                              :defaultValueField.text]){
        NSLog(@"Sending data to next vc");
        NSArray *objects=[[NSArray alloc]initWithObjects:
                          displayNameField.text,
                          systemNameField.text,
                          typeField.text,
                          defaultValueField.text,
                          _passTemplateId,
                          @"false",
                          nil];
        NSArray *keys=[[NSArray alloc]initWithObjects:
                       @"fieldDisplayName",
                       @"fieldName",
                       @"fieldType",
                       @"fieldDefaultValue",
                       @"templateId",
                       @"selected",
                       nil];
        
        dict = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        
        NSLog(@"The data in the dictionary is************************%@",dict);
        
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                           options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                             error:&error];
        
        if (! jsonData) {
            NSLog(@"Got an error: %@", error);
        } else {
            NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            NSLog(@"jsonstring %@",jsonString);
             [self addNewFieldsCall];
        }
        
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

-(void)addNewFieldsCall{
    //returnString = @"";
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    
    NSURL * url = [NSURL URLWithString:@"http://139.162.31.36:9000/addField"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *params = [NSString stringWithFormat:@"\{\"fieldDisplayName\":\"%@\",\"fieldName\":\"%@\",\"fieldType\":\"%@\",\"fieldDefaultValue\":\"%@\",\"templateId\":\"%@\",\"selected\":\"%@\"}",[dict objectForKey:@"fieldDisplayName"],[dict objectForKey:@"fieldName"],[dict objectForKey:@"fieldType"],[dict objectForKey:@"fieldDefaultValue"],[dict objectForKey:@"templateId"],[dict objectForKey:@"selected"]];
    
    NSLog(@"params %@",params);
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                           NSLog(@"Response:%@ Error : %@\n", response, error);
                                                           //NSLog(@"Response Code:%@",[response valueForKey:@"status code"]);
                                                           if(error == nil)
                                                           {
                                                               returnString = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                                               NSLog(@"Poonam Data = %@",returnString);
                                                               NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                               NSLog(@"response status code: %ld", (long)[httpResponse statusCode]);
                                                               if ([httpResponse statusCode] == 200) {
                                                                   [self parseJSON:returnString];
                                                               } else {
                                                                   //[self reportError:[httpResponse statusCode]];
                                                                   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                                                                                   message:@"An error occured. Please try again later."
                                                                                                                  delegate:self
                                                                                                         cancelButtonTitle:@"OK"
                                                                                                         otherButtonTitles:nil];
                                                                   [alert show];
                                                                   
                                                               }
                                                           }
                                                           else{
                                                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                                                                               message:@"An error occured. Please try again later."
                                                                                                              delegate:self
                                                                                                     cancelButtonTitle:@"OK"
                                                                                                     otherButtonTitles:nil];
                                                               [alert show];
                                                           }
                                                           
                                                       }];
    [dataTask resume];
    
}

-(void)parseJSON : (NSString *)responseData{
    NSString * jsonString = responseData;
    NSLog(@"responseData %@",responseData);
    NSLog(@"jsonString %@",jsonString);
    if ([jsonString intValue]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Successful!" message:@"Successfully Registered." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        alert.tag = 200;
        [alert show];
    }
    else{
        //NSStringEncoding  encoding;
        NSData * jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSError * error=nil;
        NSDictionary * parsedData = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
        NSLog(@"NSDictionery:%@",parsedData);
        /*  NSString *message = [NSString stringWithFormat:[parsedData valueForKey:@"message"]];
         //NSLog(@"userType:%@",[parsedData valueForKey:@"type"]);
         if ([message isEqualToString:@"User Already Exist!"]) {
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!"
         message:@"User already exists. Please try to Login!"
         delegate:self
         cancelButtonTitle:@"OK"
         otherButtonTitles:nil]; */
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!"
                                                        message:@"Try again later!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        alert.tag = 201;
        [alert show];
        
        
      
    }
}
/*
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        TemplateDetailView *addTemplate =
        [self.storyboard instantiateViewControllerWithIdentifier:@"TemplateDetailView"];
        [self.navigationController pushViewController:addTemplate animated:YES];
        

    }
}
*/
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


@end
