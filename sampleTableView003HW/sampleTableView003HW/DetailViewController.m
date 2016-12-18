//
//  DetailViewController.m
//  sampleTableView003HW
//
//  Created by inagaki on 2015/09/10.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"

@interface DetailViewController ()

@end

@implementation DetailViewController {
    NSArray *dicArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    dicArray = app.dicArray;
    
    _titleLabel.text = dicArray[_selectedNum][@"title"];
    _kanaLabel.text = dicArray[_selectedNum][@"kana"];
    _descriptionTextView.text = dicArray[_selectedNum][@"desc"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backButtonDidTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
