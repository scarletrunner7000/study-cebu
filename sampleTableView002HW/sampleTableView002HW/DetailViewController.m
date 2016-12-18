//
//  DetailViewController.m
//  sampleTableView002HW
//
//  Created by inagaki on 2015/09/09.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleLabel.text = _coffeeName;
    _descriptionTextView.text = _coffeeDescription;
    _imageView.image = _coffeeImage;
//    _imageView.contentMode = UIViewContentModeScaleAspectFit;
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

@end
