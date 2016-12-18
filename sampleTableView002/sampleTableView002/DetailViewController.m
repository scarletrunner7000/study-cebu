//
//  DetailViewController.m
//  sampleTableView002
//
//  Created by inagaki on 2015/09/08.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *coffeeArray = @[@"ブルーマウンテン", @"キリマンジャロ", @"ブラジル", @"コロンビア"];
    NSLog(@"もらった行番号=%d", self.selectNum);
    self.titleLabel.text = coffeeArray[self.selectNum];
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

@end
