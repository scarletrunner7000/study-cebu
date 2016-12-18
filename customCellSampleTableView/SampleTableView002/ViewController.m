//
//  ViewController.m
//  SampleTableView002
//
//  Created by Eriko Ichinohe on 2014/10/20.
//  Copyright (c) 2014年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "customTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _coffeeArray = @[@"ブルーマウンテン",@"キリマンジャロ",@"ブラジル",@"コロンビア"];

   // NSLog(@"配列の中身の数:%d",_coffeeArray.count);
    
    _coffeeListTableView.delegate = self;
    _coffeeListTableView.dataSource = self;
    
    //カスタマイズしたセルをテーブルビューにセット
    UINib *nib = [UINib nibWithNibName:@"customCell" bundle:nil];
    
    
    //カスタムセルを使用しているTableViewに登録
    [self.coffeeListTableView registerNib:nib forCellReuseIdentifier:@"Cell"];
    
}

//行数を返す
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _coffeeArray.count;
}

//セルに文字を表示する
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //定数を宣言（static = 静的)
    static NSString *CellIdentifer = @"Cell";
    
    //セルの再利用
    customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    
//    if(cell == nil){
//        //セルの初期化とスタイルの決定
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
//    }
    
    //cell.textLabel.text = [NSString stringWithFormat:@"行番号=%d",indexPath.row];
    
     //cell.textLabel.text = _coffeeArray[indexPath.row];
    
    cell.name.text = _coffeeArray[indexPath.row];
    
    
    return cell;
}

//何か行が押された時DetailViewControllerに画面遷移する
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"Tap:%ld",indexPath.row);
    
    //遷移先画面のカプセル化（インスタンス化）
    DetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    dvc.select_num = indexPath.row;
    
    //ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:dvc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
