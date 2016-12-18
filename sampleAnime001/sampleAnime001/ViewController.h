//
//  ViewController.h
//  sampleAnime001
//
//  Created by Eriko Ichinohe on 2015/09/03.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@property (weak, nonatomic) IBOutlet UIImageView *animeImageView;
- (IBAction)clickedStartButton:(id)sender;

@end

