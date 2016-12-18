//
//  ViewController.m
//  TestEchoHTML
//
//  Created by inagaki on 2015/09/18.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "ViewController.h"
#import "Question.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *testHexcodes = @[
                                @"05069ABCDEF0"
                                ];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"testEchoHTML" ofType:@"css"];
    
    Question *q = [[Question alloc] initWithHexcode:testHexcodes[0]];
    NSLog(@"%@", [q toHexcode]);
    NSLog(@"\n%@", [q toString]);
    _htmlTextView.text = [q toHTML];
    [_questionWebView loadHTMLString:[q toHTML] baseURL:[NSURL fileURLWithPath:path]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
