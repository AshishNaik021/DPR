//
//  AssistantRegister.h
//  Medico
//
//  Created by APPLE on 05/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
BOOL assistantChecked;

@interface AssistantRegister : UIViewController
@property IBOutlet UIButton *checkButton;
-(IBAction)checkButton:(id)sender;
@end
