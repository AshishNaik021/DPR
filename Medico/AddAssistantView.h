//
//  AddAssistantView.h
//  Medico
//
//  Created by APPLE on 06/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
BOOL CreateNew;
@interface AddAssistantView : UIViewController
@property IBOutlet UIButton *createNewBtn;
-(IBAction)checkBtn:(id)sender;
@end
