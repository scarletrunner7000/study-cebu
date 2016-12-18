//
//  ViewController.m
//  SampleWebView
//
//  Created by Eriko Ichinohe on 2014/10/16.
//  Copyright (c) 2014年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *myURL = [NSURL URLWithString:@"http://www.apple.com/"];
    
    NSURLRequest *myURLReq = [NSURLRequest requestWithURL:myURL];
    
    [self.myWebView loadRequest:myURLReq];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
