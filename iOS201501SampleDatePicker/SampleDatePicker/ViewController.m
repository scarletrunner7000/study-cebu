//
//  ViewController.m
//  SampleDatePicker
//
//  Created by Eriko Ichinohe on 2014/10/14.
//  Copyright (c) 2014年 Eriko Ichinohe. All rights reserved.
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

- (IBAction)changeDateTime:(id)sender {
    
    //dfという変数を宣言して、初期化
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    
    //日時データを文字列に変換する場合のフォーマットを指定
    df.dateFormat = @"yyyy/MM/dd HH:mm:ss";
    
    
    NSLog(@"%@",[df stringFromDate:self.myDatePicker.date]);
    
    self.myLabel.text = [df stringFromDate:self.myDatePicker.date];
}
@end
