//
//  ViewController.m
//  sampleTableViewCustomCellHW
//
//  Created by inagaki on 2015/09/11.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "customTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _people = app.people;

    UINib *nib = [UINib nibWithNibName:@"CustomTableViewCell" bundle:nil];
    [_myTableView registerNib:nib forCellReuseIdentifier:@"Cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _people.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    NSLog(@"%@", _people[indexPath.row][@"name"]);
    customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSLog(@"%@", _people[indexPath.row][@"name"]);
    //cell.nameLabel.text = _people[indexPath.row][@"name"];
    return cell;
}

@end
