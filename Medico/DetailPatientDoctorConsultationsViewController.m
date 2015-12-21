//
//  DetailPatientDoctorConsultationsViewController.m
//  Medico
//
//  Created by Apple on 24/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DetailPatientDoctorConsultationsViewController.h"
#import "PatientLandingPageViewController.h"
#import "PatientDoctorConsultationsViewController.h"
#import "DetailPatientDoctorConsultationsCell.h"

@interface DetailPatientDoctorConsultationsViewController ()

@end


@implementation DetailPatientDoctorConsultationsViewController
@synthesize clinicsContentView;
@synthesize profileContentView;
@synthesize bookOnlineAppointContentView;
@synthesize profileButton;
@synthesize clinicsButton;
@synthesize profileSpecializationField;
@synthesize value = _value;
@synthesize bookOnlineAppointVisiteTypeField;
@synthesize pickerVisiteTypeArr;
@synthesize picker;



- (void) homePage:(id)sender{
    PatientLandingPageViewController *PatientHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientLandingPageViewController"];
    [self.navigationController pushViewController:PatientHome animated:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"DetailPatientDoctorConsultationsViewController.m");

    [profileSpecializationField.layer setBorderWidth:1.0];
    self.navigationItem.title = @"Clinic Name";
    
    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    if (![_value isEqualToString:@"a"]) {
        
    clinicsContentView.hidden = FALSE;
    [clinicsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    profileContentView.hidden = TRUE;
    bookOnlineAppointContentView.hidden =TRUE;
    }
    else {
        clinicsContentView.hidden = TRUE;
        [clinicsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        profileContentView.hidden = TRUE;
        bookOnlineAppointContentView.hidden =FALSE;
    }
    
    //picker
    pickerVisiteTypeArr = [[NSMutableArray alloc] initWithObjects:@"Select Visite Type",@"New Profile",@"Regular Visit",@"Follow Up",@"Physical exam",nil];
    
    picker = [[UIPickerView alloc] initWithFrame:CGRectMake(20, 250, 300, 200)];
    picker.showsSelectionIndicator = YES;
    picker.hidden = YES;
    picker.delegate = self;
    //picker.tag =2;
    [self.view addSubview:picker];


}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView; {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component; {
    
    return pickerVisiteTypeArr.count;
}

-(NSString*) pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [pickerVisiteTypeArr objectAtIndex:row];
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
{
    
    
    bookOnlineAppointVisiteTypeField.text = [NSString stringWithFormat:@"%@",pickerVisiteTypeArr[row]];
    picker.hidden = YES;
    
    
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if ([textField isEqual:bookOnlineAppointVisiteTypeField]) {
        self.picker.hidden = NO;
        //        self.summaryPicker.backgroundColor = [UIColor clearColor];
        return NO;
    }
    
    return YES;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    picker.hidden = YES;
    [self.view endEditing:YES];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    DetailPatientDoctorConsultationsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    int row = [indexPath row];
    
    cell.clinicShift1BookAppButton.tag =row;
    cell.clinicShift2BookAppButton.tag =row;
    cell.clinicShift3BookAppButton.tag =row;

    [cell.clinicShift1BookAppButton addTarget:self action:@selector(clinicShift1BookApp:) forControlEvents:UIControlEventTouchUpInside];
    [cell.clinicShift2BookAppButton addTarget:self action:@selector(clinicShift2BookApp:) forControlEvents:UIControlEventTouchUpInside];
    [cell.clinicShift3BookAppButton addTarget:self action:@selector(clinicShift3BookApp:) forControlEvents:UIControlEventTouchUpInside];
   // cell.showDetailsButton.tag =row;
   // [cell.showDetailsButton addTarget:self action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
    
}
- (void)clinicShift1BookApp:(id)sender {
    UIButton *senderButton = (UIButton *)sender;
    int n = senderButton.tag;
    bookOnlineAppointContentView.hidden = FALSE;


}
- (void)clinicShift2BookApp:(id)sender {
    UIButton *senderButton = (UIButton *)sender;
    int n = senderButton.tag;
    bookOnlineAppointContentView.hidden = FALSE;

    
}
- (void)clinicShift3BookApp:(id)sender {
    UIButton *senderButton = (UIButton *)sender;
    int n = senderButton.tag;
    bookOnlineAppointContentView.hidden = FALSE;
    
    
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

- (IBAction)nextAppointment:(id)sender{
    
}

-(IBAction)lastAppointment:(id)sender{
    
}

-(IBAction)lastVisited:(id)sender{
    
}

-(IBAction)hideDetails:(id)sender{

    PatientDoctorConsultationsViewController *consultations =
        [self.storyboard instantiateViewControllerWithIdentifier:@"PatientDoctorConsultationsViewController"];
        [self.navigationController pushViewController:consultations animated:YES];
    
}

- (IBAction)goNextDetail:(id)sender {
}

- (IBAction)profile:(id)sender {
    profileContentView.hidden = FALSE;
    clinicsContentView.hidden = TRUE;
    bookOnlineAppointContentView.hidden = TRUE;
    [clinicsButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [profileButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

- (IBAction)clinics:(id)sender {
    clinicsContentView.hidden = FALSE;
    profileContentView.hidden = TRUE;
    bookOnlineAppointContentView.hidden = TRUE;
    [profileButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [clinicsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}
- (IBAction)bookOnlineAppointBookAppointment:(id)sender {
}
@end
