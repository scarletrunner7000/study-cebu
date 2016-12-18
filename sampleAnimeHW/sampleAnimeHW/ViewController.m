//
//  ViewController.m
//  sampleAnimeHW
//
//  Created by inagaki on 2015/09/09.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSInteger DURATION;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    DURATION = 3;
    _myImage.image = [UIImage imageNamed:@"img01.jpg"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapBtn:(id)sender {
    [NSTimer
     scheduledTimerWithTimeInterval:DURATION
     target:self
     selector:@selector(moveImage:)
     userInfo:nil
     repeats:YES
     ];
}

- (void)moveImage:(NSTimer *)timer {
    NSInteger tmp, x, y, w, h;
    double d_tmp;
    
    NSLog(@"\n***** beginAnimations");
    [UIView beginAnimations:nil context:nil];
    tmp = arc4random() % 2 + 1;
    [UIView setAnimationDelay:tmp];
    NSLog(@"setAnimationDelay: %ld", tmp);
    [UIView setAnimationDuration:DURATION - tmp];
    NSLog(@"setAnimationDuration: %ld", DURATION - tmp);
    x = arc4random() % 300 + 50;
    y = arc4random() % 300 + 50;
    w = arc4random() % 300 + 50;
    h = arc4random() % 300 + 50;
    _myImage.frame = CGRectMake(x, y, w, h);
    NSLog(@"x: %ld, y: %ld, w: %ld, h: %ld", x, y, w, h);
    tmp = arc4random() % 360;
    _myImage.transform = CGAffineTransformMakeRotation(tmp * M_PI / 180.0);
    NSLog(@"transform: %ld", tmp);
    d_tmp = arc4random() / ((unsigned)RAND_MAX + 1.0);
    _myImage.alpha = d_tmp;
    NSLog(@"alpha: %lf", d_tmp);
    [UIView commitAnimations];
    NSLog(@"***** commitAnimations");
}

@end
