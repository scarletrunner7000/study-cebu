//
//  detailViewController.m
//  SampleTableView002
//
//  Created by Eriko Ichinohe on 2015/01/14.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import "detailViewController.h"

@interface detailViewController ()

@end

@implementation detailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%d",self.selectNum);
    
    //配列に表示するための情報をすべて格納
    _coffeeArray = @[@{@"name":@"ブルーマウンテン",@"desc":@"説明ブルー"},
                     @{@"name":@"キリマンジャロ",@"desc":@"説明キリ"},
                     @{@"name":@"ブラジル",@"desc":@"説明ブラジル"},
                     @{@"name":@"コロンビア",@"desc":@"説明コロンビア"}];

    self.myLabel.text = [NSString stringWithFormat:@"%@とは",_coffeeArray[self.selectNum][@"name"]];
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
