//
//  ViewController.m
//  sampleNSArrayNSDictionary
//
//  Created by Eriko Ichinohe on 2015/08/27.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //配列
    NSArray *fruitsArray = @[@"バナナ",@"りんご",@"みかん",@"メロン",@"すいか"];

    NSLog(@"%@",fruitsArray[4]);
    
    NSLog(@"%@",fruitsArray[2]);
    
    
//    NSArray *fruitsArray2 = [NSArray arrayWithObjects:@"バナナ",@"りんご",@"みかん",@"メロン",@"すいか", nil];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fruitsButton0Clicked:(id)sender {
    //配列
    NSArray *fruitsArray = @[@"バナナ",@"りんご",@"みかん",@"メロン",@"すいか"];
    self.fruitsLabel.text = fruitsArray[0];
}
- (IBAction)fruitsButton1Clicked:(id)sender {
    //配列
    NSArray *fruitsArray = @[@"バナナ",@"りんご",@"みかん",@"メロン",@"すいか"];
    self.fruitsLabel.text = fruitsArray[1];
}
@end
