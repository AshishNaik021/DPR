//
//  PatientUploadPDFDocumentViewController.m
//  Medico
//
//  Created by Apple on 26/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientUploadPDFDocumentViewController.h"
#import "PatientLandingPageViewController.h"

@interface PatientUploadPDFDocumentViewController ()

@end


@implementation PatientUploadPDFDocumentViewController
@synthesize doctorConsultationButton;
@synthesize labReportRadioButton;
@synthesize dateField;

- (void) homePage:(id)sender{
    PatientLandingPageViewController *PatientHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientLandingPageViewController"];
    [self.navigationController pushViewController:PatientHome animated:YES];
    
}

- (NSString *)formatDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"dd-MMM-yyyy"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
}

- (void)updateDateField:(id)sender
{
    if (dateField.isEditing) {
        UIDatePicker *picker = (UIDatePicker*)self.dateField.inputView;
        self.dateField.text = [self formatDate:picker.date];
    }
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
//    picker.hidden = YES;
//    pickerSpeciality.hidden = YES;
    [self.view endEditing:YES];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.returnKeyType = UIReturnKeyDone;
    if (textField.tag == 6) {
        self.dateField = textField;
        
        // Create a date picker for the date field.
        UIDatePicker *datePicker = [[UIDatePicker alloc]init];
        datePicker.datePickerMode = UIDatePickerModeDate;
        datePicker.tag = 2;
        datePicker.minimumDate = [NSDate date];
        [datePicker setDate:[NSDate date]];
        [datePicker addTarget:self action:@selector(updateDateField:) forControlEvents:UIControlEventValueChanged];
        
        // If the date field has focus, display a date picker instead of keyboard.
        // Set the text to the date currently displayed by the picker.
        self.dateField.inputView = datePicker;
        self.dateField.text = [self formatDate:datePicker.date];
        
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"PatientUploadPDFDocumentViewController.m");
    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    dateField.tag = 6;
    
    self.navigationItem.title = @"Dr. Clinic";
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

- (IBAction)calendar:(id)sender {
}
- (IBAction)doctorConsultation:(id)sender {
    [doctorConsultationButton setImage:[UIImage imageNamed:@"ic_radio_button_checked.png"] forState:UIControlStateNormal];
    [labReportRadioButton setImage:[UIImage imageNamed:@"ic_radio_button_unchecked.png"] forState:UIControlStateNormal];
//    self.mapContentView.hidden = TRUE;
//    self.listContentView.hidden = FALSE;
}
- (IBAction)addDoctorConsultation:(id)sender {
}
- (IBAction)labReportRadio:(id)sender {
    [labReportRadioButton setImage:[UIImage imageNamed:@"ic_radio_button_checked.png"] forState:UIControlStateNormal];
    [doctorConsultationButton setImage:[UIImage imageNamed:@"ic_radio_button_unchecked.png"] forState:UIControlStateNormal];
//    self.listContentView.hidden = TRUE;
//    self.mapContentView.hidden = FALSE;
}
- (IBAction)addLabReport:(id)sender {
}
@end
