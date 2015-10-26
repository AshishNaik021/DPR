//
//  UploadDocumentsViewController.m
//  Medico
//
//  Created by APPLE on 26/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "UploadDocumentsViewController.h"

@interface UploadDocumentsViewController ()

@end

@implementation UploadDocumentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)captureImage:(id)sender {
}
- (IBAction)browseImage:(id)sender {
}
- (IBAction)save:(id)sender {
}
- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:Nil];

}
@end
