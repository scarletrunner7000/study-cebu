//
//  ViewController.m
//  SampleTableView002
//
//  Created by Eriko Ichinohe on 2015/01/14.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"
#import "detailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _coffeeArray = @[@"ブルーマウンテン",@"キリマンジャロ",@"ブラジル",@"コロンビア"];

    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
}

//行数を返す
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _coffeeArray.count;
}

//セルオブジェクトの作成（文字表示）
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    //定数を宣言（static = 静的)
    static NSString *CellIdentifer = @"Cell";
    
    //セルの再利用
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    
    if(cell == nil){
        //セルの初期化とスタイルの決定
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",_coffeeArray[indexPath.row]];
    return cell;
}

//行が押された時に発動するメソッド
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"行番号=%ld",(long)indexPath.row);
    
    //遷移先画面のカプセル化（インスタンス化）
    detailViewController *dvc =[self.storyboard instantiateViewControllerWithIdentifier:@"detailViewController"];
    
    dvc.selectNum = (int)indexPath.row;
    
    //ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:dvc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
