//
//  DoctorLandingPageView.m
//  Medico
//
//  Created by APPLE on 07/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DoctorLandingPageView.h"
#import "LoginPage.h"

@interface DoctorLandingPageView ()

@end

@implementation DoctorLandingPageView
@synthesize doctorName = _doctorName;
@synthesize doctorEmail = _doctorEmail;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    //    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"MyDemo" ofType:@"json"];
    //    NSString *myJson = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:NULL];
    //    NSError *error = nil;
    //    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[myJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    //    NSArray *arr = [json valueForKeyPath:@"demo"];
    //self.doctorNameLabel.text = [[arr objectAtIndex:0] objectForKey:@"Name"];
    self.doctorNameLabel.text = _doctorName;
    
    //[self setName];
    // Do any additional setup after loading the view.
}
//-(void)setName{
//    NSLog(@"docemail %@",_doctorEmail);
//        NSLog(@"docname %@",_doctorName);
//        if ([_doctorEmail isEqualToString:@"ahemad@gmail.com"])
//            self.doctorNameLabel.text=  @"Ahemad";
//        else if ([_doctorEmail isEqualToString:@"ma@gmail.com"])
//            self.doctorNameLabel.text =  @"Mayur Zambare";
//        else if([_doctorEmail isEqualToString:@"kb@gmail.com"])
//            self.doctorNameLabel.text = @"Kaustubh Bharambe";
//        else if([_doctorEmail isEqualToString:@"r@gmail.com"])
//            self.doctorNameLabel.text = @"Ram";
//}
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

- (IBAction)settings:(id)sender {
}
- (IBAction)logout:(id)sender {
    
    LoginPage *loginPage =
    [self.storyboard instantiateViewControllerWithIdentifier:@"LoginPage"];
    [self.navigationController pushViewController:loginPage animated:YES];
}

- (IBAction)searchAppointment:(id)sender {
}
- (IBAction)searchDoctor:(id)sender {
}
- (IBAction)searchClinic:(id)sender {
}
- (IBAction)patientprofile:(id)sender {
}
- (IBAction)manageFinance:(id)sender {
}
- (IBAction)manageAppointments:(id)sender {
}
@end
