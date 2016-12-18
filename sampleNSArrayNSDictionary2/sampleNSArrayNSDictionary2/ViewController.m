//
//  ViewController.m
//  sampleNSArrayNSDictionary2
//
//  Created by Eriko Ichinohe on 2015/08/27.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //連想配列
    NSDictionary *dict = @{@"name":@"えりこ",@"age":@"36",@"area":@"青森県",@"gender":@"女",@"address":@"cebu"};
    
    NSDictionary *dict2 = @{@"name":@"はじめ",@"age":@"27",@"area":@"愛知県",@"gender":@"男",@"address":@"cebu"};
    
    NSArray *people = @[dict,dict2];
    
    
    NSLog(@"%@",people[1][@"name"]);
    
    NSLog(@"%@",dict[@"gender"]);
    
    //if文
    BOOL flag = NO;
    
    if (flag == YES) {
        NSLog(@"Yesです");
    }else{
        NSLog(@"Noです");
    }
    
    int num = 9;
    if (num <= 10) {
        NSLog(@"こどもです");
    }else{
        NSLog(@"もっと大人かも");
    }
    
    //for文（繰り返し）
    for (int i=0; i < 10; i++) {
        NSLog(@"Hello");
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
