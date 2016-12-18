//
//  ViewController.m
//  sampleTableViewCustomCell
//
//  Created by inagaki on 2015/09/10.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "ViewController.h"
#import "customTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    
    _coffeeArray = @[@"ブルーマウンテン", @"キリマンジャロ", @"ブラジル", @"コロンビア"];
    
    // カスタムセルを設定
    // カスタマイズしたセルをテーブルビューでた買えるようにするため nib を宣言
    // * nibWithNibName には .xib ファイルの名前と揃える
    UINib *nib = [UINib nibWithNibName:@"customCell" bundle:nil];
    
    // 使用する TableVIew に登録
    // * forCellReuseIdentifier は cell を作ったときに使ったものと揃える
    [_myTableView registerNib:nib forCellReuseIdentifier:@"Cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _coffeeArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Celldentifier = @"Cell";
    
    customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Celldentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
//                                      reuseIdentifier:Celldentifier];
//    }
    cell.titleLabel.text = _coffeeArray[indexPath.row];
    
    return cell;
}

@end
