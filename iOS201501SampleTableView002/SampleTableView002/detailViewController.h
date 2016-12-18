//
//  detailViewController.h
//  SampleTableView002
//
//  Created by Eriko Ichinohe on 2015/01/14.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailViewController : UIViewController{
    NSArray *_coffeeArray;
}

@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UITextView *myTextView;
@property (nonatomic,assign) int selectNum;

@end
