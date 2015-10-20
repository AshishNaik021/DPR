//
//  SMSConfirmationView.m
//  Medico
//
//  Created by APPLE on 07/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "SMSConfirmationView.h"


@interface SMSConfirmationView ()

@end

@implementation SMSConfirmationView

@synthesize data = _data;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Data dic: %@",_data);
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:_data
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"%2",jsonString);
    }
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

- (IBAction)smsResend:(id)sender {
}
- (IBAction)emailResend:(id)sender {
}
- (IBAction)registrationConfirmed:(id)sender {
}
@end
