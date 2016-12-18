//
//  ViewController.m
//  SampleCoreDataFriends
//
//  Created by Eriko Ichinohe on 2015/04/24.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"
#import "FriendsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //プロジェクト内のファイルにアクセスできるオブジェクトを作成
    NSBundle *bundle = [NSBundle mainBundle];
    
    //読み込むプロパティリストのファイルパス（場所）を指定
    NSString *path = [bundle pathForResource:@"FriendsPerArea" ofType:@"plist"];
    
    //プロパティリストの中身のデータを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    _areaArray = [dic objectForKey:@"PrefectureList"];
    
    

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _areaArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdetifier = @"Cell";
    
    //セルの再利用
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdetifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdetifier];
    }
    
    cell.textLabel.text = _areaArray[indexPath.row][@"Name"];
    
    return cell;
    
}

//セルがタップされた時に発動するメソッド
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //画面遷移するViewControllerのカプセル化（インスタンス化）
    FriendsViewController *fvc = [self.storyboard instantiateViewControllerWithIdentifier:@"FriendsViewController"];
    
    //選択された地域の情報をFriends画面へ渡す
    fvc.areaString = _areaArray[indexPath.row][@"Name"];
    fvc.areaNum = [_areaArray[indexPath.row][@"No"] intValue];
    
    //ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:fvc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
