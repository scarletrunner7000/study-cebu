//
//  ViewController.m
//  sampleTableViewCustomCellHW2
//
//  Created by inagaki on 2015/09/11.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    
    AppDelegate *app = [[UIApplication sharedApplication] delegate];
    _people = app.people;
    
    UINib *nib = [UINib nibWithNibName:@"customCell" bundle:nil];
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
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.mainImageView.image = _people[indexPath.row][@"image"];
    cell.nameLabel.text = _people[indexPath.row][@"name"];
    cell.englishProgressView.progress = [_people[indexPath.row][@"progress"] doubleValue] / 10;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    dvc.person = _people[indexPath.row];
    
    [[self navigationController] pushViewController:dvc animated:YES];
}

@end
