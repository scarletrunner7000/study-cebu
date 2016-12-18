//
//  ViewController.h
//  SampleDatePicker
//
//  Created by Eriko Ichinohe on 2014/10/14.
//  Copyright (c) 2014年 Eriko Ichinohe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@property (weak, nonatomic) IBOutlet UIDatePicker *myDatePicker;

- (IBAction)changeDateTime:(id)sender;


@end

