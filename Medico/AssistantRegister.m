//
//  AssistantRegister.m
//  Medico
//
//  Created by APPLE on 05/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "AssistantRegister.h"

@interface AssistantRegister ()

@end

@implementation AssistantRegister

@synthesize checkButton;

-(IBAction)checkButton:(id)sender{
    if(!assistantChecked){
        [checkButton setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
        assistantChecked = YES;
    }
    else if(assistantChecked){
        [checkButton setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        assistantChecked = NO;
        
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
      assistantChecked = NO;
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
