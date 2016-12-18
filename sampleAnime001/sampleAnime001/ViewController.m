//
//  ViewController.m
//  sampleAnime001
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
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickedStartButton:(id)sender {
    
    //アニメーション用の画像ファイル名が格納されている配列
    NSArray *imageArray = @[[UIImage imageNamed:@"walk01.png"],
                            [UIImage imageNamed:@"walk02.png"],
                            [UIImage imageNamed:@"walk03.png"],
                            [UIImage imageNamed:@"walk04.png"]];
    
    self.animeImageView.animationImages = imageArray;
    self.animeImageView.animationDuration = 0.3;
    self.animeImageView.animationRepeatCount = 0;
    [self.animeImageView startAnimating];
}
@end
