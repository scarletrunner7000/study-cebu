//
//  ViewController.m
//  SampleTableView003
//
//  Created by Eriko Ichinohe on 2014/10/21.
//  Copyright (c) 2014年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _programmingArray = @[@"C",@"Java",@"Objective-C",@"C++",@"HTML",@"CSS",@"Javascript",@"MySQL",@"Ruby"];
    
    // NSLog(@"配列の中身の数:%d",_coffeeArray.count);
    
    _proTableView.delegate = self;
    _proTableView.dataSource = self;
}

//行数を返す
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _programmingArray.count;
}

//セルに文字を表示する
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
    
    //cell.textLabel.text = [NSString stringWithFormat:@"行番号=%d",indexPath.row];
    
    cell.textLabel.text = _programmingArray[indexPath.row];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *dvc = [segue destinationViewController];
    dvc.selectNum = self.proTableView.indexPathForSelectedRow.row;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
