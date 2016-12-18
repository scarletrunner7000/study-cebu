//
//  DetailViewController.m
//  sampleTableView003
//
//  Created by inagaki on 2015/09/10.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%ld", _selectNum);
    
    // 表示用の配列 (配列+ディクショナリー) を作成
    NSArray *dicArray = @[
                          @{@"title":@"C",
                            @"desc":@"C言語の説明文だよ"},
                          @{@"title":@"Objective-C",
                            @"desc":@"Objective-Cの説明文だよ"},
                          @{@"title":@"C++",
                            @"desc":@"C++の説明文だよ"},
                          @{@"title":@"HTML",
                            @"desc":@"HTMLの説明文だよ"},
                          @{@"title":@"CSS",
                            @"desc":@"CSSの説明文だよ"},
                          @{@"title":@"Javascript",
                            @"desc":@"Javascriptの説明文だよ"},
                          @{@"title":@"MySQL",
                            @"desc":@"MySQLの説明文だよ"},
                          @{@"title":@"Ruby",
                            @"desc":@"Rubyの説明文だよ"}
                          ];
    
    _titleLabel.text = dicArray[_selectNum][@"title"];
    _descriptionTextView.text = dicArray[_selectNum][@"desc"];
    
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

- (IBAction)tapBack:(id)sender {
    [self dismissViewControllerAnimated: YES completion: nil];
}
@end
