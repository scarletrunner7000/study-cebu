//
//  ViewController.m
//  samplePushNotice
//
//  Created by inagaki on 2015/09/11.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapPushButton:(id)sender {
    // 初期化
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    // 10秒後に通知が来るように設定
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    localNotification.alertBody = @"10秒経過しました";
    
    // バッジのセット
    localNotification.applicationIconBadgeNumber = 3;
    
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    // アプリにローカル通知を登録
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];

}

@end
