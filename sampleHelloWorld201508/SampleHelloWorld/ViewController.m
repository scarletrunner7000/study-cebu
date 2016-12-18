//
//  ViewController.m
//  SampleHelloWorld
//
//  Created by Eriko Ichinohe on 2015/08/26.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float flnum = 0.3;
    
    int numberone = 1;
    
    int sumint = numberone + flnum;
    
    BOOL flag = NO;
    
    NSLog(@"BOOL型の正体:%d",flag);
    
    NSLog(@"足し算の答えは%d",sumint);
    
    // ラベルにHello,Cebuと表示する
    NSString *str = @"Hello,Cebu!";
    
    str = @"Hello,NexSeed.";
    
    self.MyLabel.text = [NSString stringWithFormat:@"%d",sumint];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
