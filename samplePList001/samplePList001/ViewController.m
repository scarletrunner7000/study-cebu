//
//  ViewController.m
//  samplePList001
//
//  Created by inagaki on 2015/09/21.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    
    // _areaList = @[@"北海道", @"青森県", @"岩手県", @"秋田県", @"宮城県"];
    
    // プロジェクト内のファイルにアクセスするオブジェクトを作成
    NSBundle *bundle = [NSBundle mainBundle];
    
    // 読み込むプロパティリストのファイルパス（場所）を指定
    NSString *path = [bundle pathForResource:@"FriendsPerArea" ofType:@"plist"];
    
    // プロパティの中身のデータを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    _areaList = [dic objectForKey:@"AreaList"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _areaList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [_myTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = _areaList[indexPath.row][@"Name"];
    
    return cell;
}

@end
