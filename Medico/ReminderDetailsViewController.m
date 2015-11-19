//
//  ReminderDetailsViewController.m
//  Medico
//
//  Created by APPLE on 29/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "ReminderDetailsViewController.h"
#import "DoctorLandingPageView.h"

@interface ReminderDetailsViewController ()

@end

@implementation ReminderDetailsViewController
@synthesize detailReminderArray;
@synthesize dateLabel;
@synthesize timeLabel;
@synthesize discussionLabel;

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}


- (void)viewDidLoad {
    NSLog(@"ReminderDetailsViewController.m");
    [super viewDidLoad];
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Reminder";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    dateLabel.text = [detailReminderArray[0] objectForKey:@"date"];
    timeLabel.text = [detailReminderArray[0] objectForKey:@"time"];
    if (![[detailReminderArray[0] objectForKey:@"title"] isEqual:[NSNull null]]) {
        discussionLabel.text = [detailReminderArray[0] objectForKey:@"title"];
    }
    else{
        discussionLabel.text = [NSString stringWithFormat:@"Unknown"];
    }
    //test purpose only
    [self scheduleNotificationForDate];
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
//
//- (void)scheduleNotificationWithItem{
//    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
//    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
//    NSLog(<#NSString *format, ...#>)
//    [dateComps setDay:];
//    [dateComps setMonth:item.month];
//    [dateComps setYear:item.year];
//    [dateComps setHour:item.hour];
//    [dateComps setMinute:item.minute];
//    NSDate *itemDate = [calendar dateFromComponents:dateComps];
//    
//    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
//    if (localNotif == nil)
//        return;
//    localNotif.fireDate = [itemDate dateByAddingTimeIntervalInterval:-(minutesBefore*60)];
//    localNotif.timeZone = [NSTimeZone defaultTimeZone];
//    
//    localNotif.alertBody = [NSString stringWithFormat:NSLocalizedString(@"%@ in %i minutes.", nil),
//                            item.eventName, minutesBefore];
//    localNotif.alertAction = NSLocalizedString(@"View Details", nil);
//    localNotif.alertTitle = NSLocalizedString(@"Item Due", nil);
//    
//    localNotif.soundName = UILocalNotificationDefaultSoundName;
//    localNotif.applicationIconBadgeNumber = 1;
//    
//    NSDictionary *infoDict = [NSDictionary dictionaryWithObject:item.eventName forKey:ToDoItemKey];
//    localNotif.userInfo = infoDict;
//    
//    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
//}
- (void)scheduleNotificationForDate
{
    NSLog(@"alarm");
    NSLog(@"Printing date:%@",[detailReminderArray[0] objectForKey:@"date"]);
    NSLog(@"Printing time:%@",[detailReminderArray[0] objectForKey:@"time"]);
    NSLog(@"Printing title:%@",[detailReminderArray[0] objectForKey:@"title"]);
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    if (localNotif == nil) return;
    NSDate *fireTime = [[NSDate date] addTimeInterval:5]; // adds 10 secs
    localNotif.fireDate = [self setFireDate];
    localNotif.alertBody = @"Reminder!";
    NSString *reminderTime = [NSString stringWithFormat:[detailReminderArray[0] objectForKey:@"date"]];
    reminderTime = [reminderTime stringByAppendingString:[detailReminderArray[0] objectForKey:@"time"]];
    NSLog(@"remindertime:%@",reminderTime);
    NSDictionary *infoDict = [NSDictionary dictionaryWithObjectsAndKeys:reminderTime, @"reminderTime",nil];
    NSLog(@"infodic:%@",infoDict);
    localNotif.userInfo = [NSDictionary dictionaryWithDictionary:infoDict];
    NSLog(@"checking userinfo:%@",localNotif.userInfo);
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
    NSLog(@"alarm1");
}
-(NSDate *)setFireDate{
    NSCalendar *calender;
    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
    [dateComps setDay:(long)[self getDay]];
    [dateComps setMonth:(long)[self getMonth]];
    [dateComps setYear:(long)[self getYear]];
    [dateComps setHour:(long)[self getHours]];
    [dateComps setMinute:(long)[self getMinutes]];
    NSDate *itemDate = [calender dateFromComponents:dateComps];
    return itemDate;
}
-(NSString *)getDay{
    NSString *str = [NSString stringWithFormat:[detailReminderArray[0] objectForKey:@"date"]];
    NSArray* components = [str componentsSeparatedByString:@"-"];
    NSLog(@"Date only:%@",components[0]);
    return components[0];
}
-(NSString *)getMonth{
    NSString *str = [NSString stringWithFormat:[detailReminderArray[0] objectForKey:@"date"]];
    NSArray* components = [str componentsSeparatedByString:@"-"];
    NSLog(@"Month only:%@",components[1]);
    return components[1];
}
-(NSString *)getYear{
    NSString *str = [NSString stringWithFormat:[detailReminderArray[0] objectForKey:@"date"]];
    NSArray* components = [str componentsSeparatedByString:@"-"];
    NSLog(@"Year only:%@",components[2]);
    return components[2];
}
-(NSString *)getHours{
    NSString *str = [NSString stringWithFormat:[detailReminderArray[0] objectForKey:@"time"]];
    NSArray* components = [str componentsSeparatedByString:@":"];
    NSLog(@"Hours only:%@",components[0]);
    return components[0];
}
-(NSString *)getMinutes{
    NSString *str = [NSString stringWithFormat:[detailReminderArray[0] objectForKey:@"time"]];
    NSArray* components = [str componentsSeparatedByString:@":"];
    NSLog(@"Minutes only:%@",components[1]);
    return components[1];
}
- (IBAction)setDateTimeAlarm:(id)sender {
    [self scheduleNotificationForDate];
}
@end
