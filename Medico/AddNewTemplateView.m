//
//  AddNewTemplateView.m
//  Medico
//
//  Created by APPLE on 06/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "AddNewTemplateView.h"

@interface AddNewTemplateView ()

@end

@implementation AddNewTemplateView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home.png"]];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc] initWithCustomView:image];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
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
