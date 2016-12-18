//
//  ViewController.h
//  SampleActionSheet
//
//  Created by Eriko Ichinohe on 2014/10/15.
//  Copyright (c) 2014年 Eriko Ichinohe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UIButton *myButton;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

- (IBAction)tapBtn:(id)sender;

@end

