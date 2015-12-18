//
//  AddNewTemplateView.m
//  Medico
//
//  Created by APPLE on 06/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "AddNewTemplateView.h"
#import "TemplateDetailView.h"
#import "DoctorLandingPageView.h"

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

@synthesize  keyboardVisible;
@synthesize offset;
@synthesize height;
@synthesize width;
@synthesize screen;
@synthesize scrollHeight;
@synthesize scroll;

@synthesize pickerSystemArr;
@synthesize pickerSystemName;
@synthesize pickerType;
@synthesize pickerTypeArr;


- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

- (void)viewDidLoad {
    NSLog(@"AddNewTemplateView.m");
    [super viewDidLoad];
    
    keyboardVisible = NO;
    screen = [[UIScreen mainScreen] bounds];
    width = CGRectGetWidth(screen);
    //Bonus height.
    height = CGRectGetHeight(screen);
    scrollHeight = height + 400;
    NSLog(@"Width is--- %f",width);
    NSLog(@"Height is--- %f",height);
    [scroll setScrollEnabled:YES];
    [scroll setContentSize:CGSizeMake(width, scrollHeight)];
    
    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;

    NSLog(@"pass ID=%@",_passTemplateId);
    self.navigationItem.title = @"Add New Fields";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];

    //picker
    pickerTypeArr = [[NSMutableArray alloc] initWithObjects:@"String",
                     @"Numeric",
                     @"String",
                     @"Currency",
                     @"Date",
                     @"String",
                     @"Numeric",
                     @"Note",
                     @"Custom",
                     nil];
    
    pickerSystemArr = [[NSMutableArray alloc] initWithObjects:@"Name",
                       @"Cost",
                       @"Procedure Date",
                       @"Currency",
                       @"Discount",
                       @"Taxes",
                       @"Total",
                       @"Custom", nil];
    
    pickerType = [[UIPickerView alloc] initWithFrame:CGRectMake(20, 450, 300, 200)];
    pickerType.showsSelectionIndicator = YES;
    pickerType.hidden = YES;
    pickerType.delegate = self;
    pickerType.tag =2;
    [self.view addSubview:pickerType];
    
    pickerSystemName = [[UIPickerView alloc] initWithFrame:CGRectMake(20, 450, 300, 200)];
    pickerSystemName.showsSelectionIndicator = YES;
    pickerSystemName.hidden = YES;
    pickerSystemName.delegate = self;
    pickerSystemName.tag = 3;
    [self.view addSubview:pickerSystemName];

    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView; {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component; {
    
    NSInteger retval;
    if (pickerView.tag ==2) {
        retval = pickerTypeArr.count;
    }
    else if(pickerView.tag == 3){
        retval = pickerSystemArr.count;
    }
    return retval;
    
    
    //return pickerBloodGroupArr.count;
    
}
-(NSString*) pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *str;
    if (pickerView.tag == 2) {
        str =[NSString stringWithFormat:@"%@",[pickerTypeArr objectAtIndex:row]];
    }
    else if(pickerView.tag == 3){
        str = [NSString stringWithFormat:@"%@",pickerSystemArr[row]];
    }
    return str;
    
    
    
    //return [pickerBloodGroupArr objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
{
    
    if (pickerView.tag == 2) {
        typeField.text = [NSString stringWithFormat:@"%@",pickerTypeArr[row]];
        pickerType.hidden = YES;
    }
    else if (pickerView.tag == 3){
        systemNameField.text = [NSString stringWithFormat:@"%@",pickerSystemArr[row]];
        pickerSystemName.hidden = YES;
    }
    else{
        
    }
    
    
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    /*if ([textField isEqual:scheduleField]) {
     self.medSchedule.hidden = NO;
     return NO;
     }
     else if ([textField isEqual:numberOfDosesField]){
     self.dosesPicker.hidden = NO;
     return NO;
     }
     return YES;
     */
    
    if ([textField isEqual:typeField]) {
        self.pickerType.hidden = NO;
        //        self.summaryPicker.backgroundColor = [UIColor clearColor];
        return NO;
    }
    else if ([textField isEqual:systemNameField]){
        self.pickerSystemName.hidden = NO;
        return NO;
    }
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    pickerSystemName.hidden = YES;
    pickerType.hidden = YES;
    [self.view endEditing:YES];
}


- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"Registering for keyboard events");
    
    // Register for the events
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidShow:)
                                                 name: UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidHide:)
                                                 name: UIKeyboardDidHideNotification object:nil];
    
    //Initially the keyboard is hidden
    keyboardVisible = NO;
}

-(void) viewWillDisappear:(BOOL)animated
{
    NSLog (@"Unregister for keyboard events");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void) keyboardDidShow: (NSNotification *)notif
{
    // If keyboard is visible, return
    if (keyboardVisible)
    {
        NSLog(@"Keyboard is already visible. Ignore notification.");
        return;
    }
    
    // Get the size of the keyboard.
    NSDictionary* info = [notif userInfo];
    NSValue* aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];
    CGSize keyboardSize = [aValue CGRectValue].size;
    
    // Save the current location so we can restore
    // when keyboard is dismissed
    offset = self.scroll.contentOffset;
    
    // Resize the scroll view to make room for the keyboard
    CGRect viewFrame = scroll.frame;
    viewFrame.size.height -= keyboardSize.height;
    scroll.frame = viewFrame;
    
    // Keyboard is now visible
    keyboardVisible = YES;
}

-(void) keyboardDidHide: (NSNotification *)notif
{
    // Is the keyboard already shown
    if (!keyboardVisible)
    {
        NSLog(@"Keyboard is already hidden. Ignore notification.");
        return;
    }
    
    // Reset the frame scroll view to its original value
    scroll.frame = CGRectMake(0, 0, width, scrollHeight);
    
    // Reset the scrollview to previous location
    scroll.contentOffset = offset;
    
    // Keyboard is no longer visible
    keyboardVisible = NO;
    
}

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
