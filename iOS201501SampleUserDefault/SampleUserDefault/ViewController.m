//
//  ViewController.m
//  SampleUserDefault
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

    //UserDefaultObjectを用意する
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //保存されたデータを取り出す
    NSString *memoStr = [defaults stringForKey:@"MEMO"];
    self.myTextField.text = memoStr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark テキストフィールド周り
- (IBAction)tapReturn:(id)sender {
    
    //UserDefaultObjectを用意する
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //文字を保存
    [defaults setObject:self.myTextField.text forKey:@"MEMO"];
    
    [defaults synchronize];
    
}
@end
