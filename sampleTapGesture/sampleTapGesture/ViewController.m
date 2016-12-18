//
//  ViewController.m
//  sampleTapGesture
//
//  Created by inagaki on 2015/09/07.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tapBlueView:(id)sender {
    NSLog(@"BlueTap");
}
- (IBAction)swipeGreenView:(id)sender {
    NSLog(@"GreenSwipe");
}

@end
