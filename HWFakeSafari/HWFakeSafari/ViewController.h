//
//  ViewController.h
//  HWFakeSafari
//
//  Created by Eriko Ichinohe on 2015/01/28.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *fakeWebView;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;

- (IBAction)searchButtonDidTap:(id)sender;

@end

