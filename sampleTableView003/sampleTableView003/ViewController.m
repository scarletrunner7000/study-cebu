//
//  ViewController.m
//  sampleTableView003
//
//  Created by inagaki on 2015/09/10.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;

    _programmings = @[@"Java", @"Objective-C", @"C++", @"HTML", @"CSS", @"Javascript", @"MySQL", @"Ruby"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _programmings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                      reuseIdentifier: CellIdentifier];
    }
    cell.textLabel.text = _programmings[indexPath.row];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // DetailViewController のインスタンス化
    DetailViewController *dvc = [segue destinationViewController];
    
    // TableView で選択されたセルの番号を設定
    dvc.selectNum = _myTableView.indexPathForSelectedRow.row;
}

@end
