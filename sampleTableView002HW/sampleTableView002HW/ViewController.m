//
//  ViewController.m
//  sampleTableView002HW
//
//  Created by inagaki on 2015/09/09.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _coffeeTableView.dataSource = self;
    _coffeeTableView.delegate = self;
    
    // リストの内容になる配列をし用意する
    _coffeeNames = @[@"ブルーマウンテン", @"キリマンジャロ", @"ブラジル", @"コロンビア"];
    _coffeeDescriptions = @[
                            @"甘･酸･苦の三つの味が絶妙に調和し、香り高い風味が特徴で、コーヒーの王者といわれています。ジャマイカ東部のブルー・マウンテン連峰の定められたエリアのものだけをブルー・マウンテンと呼びます。",
                            @"強い酸味と甘みが調和し、高い香りで上品な風味が特徴です。「キリマンジャロ」はアフリカの最高峰キリマンジャロで栽培されることに由来します。",
                            @"ブラジル産は適度な苦味と柔らかな酸味のバランスがよく、癖がないためさまざまなブレンドにも用いられます。世界で最多の生産量を誇ります。「ブラジル・サントス」はサントス港出港のコーヒー豆です。",
                            @"甘い香りとまろやかな酸味でマイルドコーヒーの代名詞です。全体的に豆は大粒ですが、その中でも粒の大きいスプレモと、小さめのエキセルソに分けられます。"
                            ];
    _coffeeImages = @[
                      [UIImage imageNamed:@"bluemountain.jpeg"],
                      [UIImage imageNamed:@"kilimanjaro.jpeg"],
                      [UIImage imageNamed:@"brazil.jpg"],
                      [UIImage imageNamed:@"columbia.jpeg"]
                      ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _coffeeNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@", _coffeeNames[indexPath.row]];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.imageView.image = _coffeeImages[indexPath.row];
    cell.backgroundColor = [UIColor brownColor];
    cell.textLabel.highlightedTextColor = [UIColor darkGrayColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    dvc.selectNum = indexPath.row;
    dvc.coffeeName = _coffeeNames[indexPath.row];
    dvc.coffeeDescription = _coffeeDescriptions[indexPath.row];
    dvc.coffeeImage = _coffeeImages[indexPath.row];
    
    [[self navigationController] pushViewController:dvc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
