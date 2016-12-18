//
//  ViewController.h
//  sampleNSArrayNSDictionary
//
//  Created by Eriko Ichinohe on 2015/08/27.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *fruitsLabel;

@property (weak, nonatomic) IBOutlet UIButton *fruitsButton0;

- (IBAction)fruitsButton0Clicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *fruitsButton1;
- (IBAction)fruitsButton1Clicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *fruitsButton2;

@end

