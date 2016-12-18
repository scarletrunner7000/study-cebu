//
//  ViewController.m
//  SampleAlertView
//
//  Created by Eriko Ichinohe on 2014/07/11.
//  Copyright (c) 2014年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"今日アクティビティ行きますか？"
        message:@"行きます？"
        delegate:self
        cancelButtonTitle:@"Cancel"
        otherButtonTitles:@"OK", nil];
    
    
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

    if(buttonIndex == 1){
        NSLog(@"OK");
        self.myLabel.text = @"アクティビティ楽しんで！";
    }else{
        NSLog(@"Cancel");
        self.myLabel.text = @"次回はアクティビティ行きましょう！";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
