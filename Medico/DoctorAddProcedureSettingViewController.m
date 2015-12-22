//
//  DoctorAddProcedureSettingViewController.m
//  Medico
//
//  Created by Apple on 16/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DoctorAddProcedureSettingViewController.h"

@interface DoctorAddProcedureSettingViewController ()

@end


@implementation DoctorAddProcedureSettingViewController
@synthesize picker;
@synthesize pickerCategoryArr;
@synthesize catagoryTypeField;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"DoctorAddProcedureSettingViewController.m");
    // Do any additional setup after loading the view.
    //picker
    pickerCategoryArr = [[NSMutableArray alloc] initWithObjects:@"Select Catagory",@"Category1",@"Category2",@"Category3",@"Category4",@"Category5",@"Category6",@"Category7",@"Category8",nil];
    
    picker = [[UIPickerView alloc] initWithFrame:CGRectMake(20, 230, 300, 200)];
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
    
    return pickerCategoryArr.count;
}

-(NSString*) pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [pickerCategoryArr objectAtIndex:row];
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
{
    
    
    catagoryTypeField.text = [NSString stringWithFormat:@"%@",pickerCategoryArr[row]];
    picker.hidden = YES;
    
    
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if ([textField isEqual:catagoryTypeField]) {
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

- (IBAction)add:(id)sender {
}
- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:Nil];
}
@end
