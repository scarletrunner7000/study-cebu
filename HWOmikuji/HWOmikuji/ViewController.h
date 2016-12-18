//
//  ViewController.h
//  HWOmikuji
//
//  Created by Eriko Ichinohe on 2015/01/26.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnOmikuji;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

- (IBAction)tapBtnOmikuji:(id)sender;

@end

