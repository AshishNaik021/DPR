//
//  AboutMedicoViewController.m
//  Medico
//
//  Created by Apple on 11/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "AboutMedicoViewController.h"

@interface AboutMedicoViewController ()

@end

@implementation AboutMedicoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background final640_940.png"]];
    self.view.backgroundColor = [UIColor clearColor];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"Background final640_940.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    [self.navigationController.navigationBar setTranslucent:NO];

    
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    // self.navigationController.navigationBar.backgroundColor = [UIColor cyanColor];//[UIColor colorWithRed:120 green:211 blue:199 alpha:1.0];
   // self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];

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

@end
