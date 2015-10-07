//
//  AddAssistantView.m
//  Medico
//
//  Created by APPLE on 06/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "AddAssistantView.h"

@interface AddAssistantView ()

@end

@implementation AddAssistantView
@synthesize createNewBtn;

-(void)checkBtn:(id)sender{
    if(!CreateNew){
        [createNewBtn setImage:[UIImage imageNamed:@"checked.png"]forState:UIControlStateNormal];
         CreateNew= YES;
    }
    else if(CreateNew){
        [createNewBtn setImage:[UIImage imageNamed:@"unchecked.png"]forState:UIControlStateNormal];
        CreateNew = NO;
        
    }


    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CreateNew = NO;
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

- (IBAction)changeImage:(id)sender {
}
- (IBAction)addCalendar:(id)sender {
}
- (IBAction)readTermConditions:(id)sender {
}
- (IBAction)createAssistant:(id)sender {
}
- (IBAction)addLocation:(id)sender {
}
@end
