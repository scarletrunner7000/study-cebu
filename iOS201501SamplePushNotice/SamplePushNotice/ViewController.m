//
//  ViewController.m
//  SamplePushNotice
//
//  Created by Eriko Ichinohe on 2014/07/21.
//  Copyright (c) 2014年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapBtn:(id)sender {
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    //10秒後に通知が来るように設定
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    
    localNotification.alertBody = @"10秒経過しました";
    
    localNotification.applicationIconBadgeNumber = 1;
    
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}
@end
