//
//  ViewController.m
//  samplePListHW
//
//  Created by inagaki on 2015/09/21.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "ViewController.h"
#import "AreaViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"FriendsPerArea" ofType:@"plist"];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSInteger selectedNum = _myTableView.indexPathForSelectedRow.row;
    AreaViewController *areaView = [segue destinationViewController];
    areaView.no = selectedNum;
    areaView.name = _areaList[selectedNum][@"Name"];
    areaView.friendsList = _areaList[selectedNum][@"FriendsList"];
    
}

@end
