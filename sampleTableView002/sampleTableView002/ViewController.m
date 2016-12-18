//
//  ViewController.m
//  sampleTableView002
//
//  Created by inagaki on 2015/09/08.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // リストの内容になる配列をし用意する
    _coffeeNames = @[@"ブルーマウンテン", @"キリマンジャロ", @"ブラジル", @"コロンビア"];
    _coffeeDescriptions = @[
            @"甘･酸･苦の三つの味が絶妙に調和し、香り高い風味が特徴で、コーヒーの王者といわれています。ジャマイカ東部のブルー・マウンテン連峰の定められたエリアのものだけをブルー・マウンテンと呼びます。",
            @"強い酸味と甘みが調和し、高い香りで上品な風味が特徴です。「キリマンジャロ」はアフリカの最高峰キリマンジャロで栽培されることに由来します。",
            @"ブラジル産は適度な苦味と柔らかな酸味のバランスがよく、癖がないためさまざまなブレンドにも用いられます。世界で最多の生産量を誇ります。「ブラジル・サントス」はサントス港出港のコーヒー豆です。",
            @"甘い香りとまろやかな酸味でマイルドコーヒーの代名詞です。全体的に豆は大粒ですが、その中でも粒の大きいスプレモと、小さめのエキセルソに分けられます。"
                            ];

    self.coffeeTableView.dataSource = self;
    self.coffeeTableView.delegate = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _coffeeNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    // 再利用可能なセルオブジェクトの作成
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@", _coffeeNames[indexPath.row]];
    return cell;
}

// 行が押されたときに発動するメソッド
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"行番号=%ld", indexPath.row);
    
    // 遷移先画面のカプセル化（インスタンス化）
    DetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    // 押された番号を遷移先画面のプロパティーにセット
    dvc.selectNum = (int)indexPath.row;
    
    // ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:dvc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
