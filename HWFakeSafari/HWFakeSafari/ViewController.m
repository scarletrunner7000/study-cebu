//
//  ViewController.m
//  HWFakeSafari
//
//  Created by Eriko Ichinohe on 2015/01/28.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *urlString = [defaults stringForKey: @"lastOpenedURL"];
    if (urlString == nil) {
        urlString = [NSString stringWithFormat: @"%@", @"https://www.google.com"];
    }
    _myTextField.text = urlString;
    NSURL *myURL = [NSURL URLWithString: urlString];
    NSURLRequest *myRequest = [NSURLRequest requestWithURL: myURL];
    [_fakeWebView loadRequest: myRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchButtonDidTap:(id)sender {
    NSURL *myURL = [NSURL URLWithString: _myTextField.text];
    NSURLRequest *myRequest = [NSURLRequest requestWithURL: myURL];
    [_fakeWebView loadRequest: myRequest];
    
    // 次回起動時に使えるように最後に開いた URL を記録する。
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: _myTextField.text forKey: @"lastOpenedURL"];
    [defaults synchronize];
}

@end
