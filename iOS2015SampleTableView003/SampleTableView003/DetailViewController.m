//
//  DetailViewController.m
//  SampleTableView003
//
//  Created by Eriko Ichinohe on 2014/10/21.
//  Copyright (c) 2014年 Eriko Ichinohe. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
//    ViewController *vc =[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
//    
//    [self presentViewController:vc animated:YES completion:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
