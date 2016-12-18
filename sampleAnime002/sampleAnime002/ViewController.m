//
//  ViewController.m
//  sampleAnime002
//
//  Created by Eriko Ichinohe on 2015/09/03.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //タイマーを宣言
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(moveLabel:) userInfo:nil repeats:YES];
}

-(void)moveLabel:(NSTimer *)timer{
    float wx = self.movingLabel.center.x;
    float wy = self.movingLabel.center.y;
    wx += 10;
    if (320 < wx){
        wx = 0;
    }
    
    wy += 5;
    if (480 < wy){
        wy = 0;
    }
    
    self.movingLabel.center = CGPointMake(wx, wy);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
