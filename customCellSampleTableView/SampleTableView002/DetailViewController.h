//
//  DetailViewController.h
//  SampleTableView002
//
//  Created by Eriko Ichinohe on 2014/10/20.
//  Copyright (c) 2014年 Eriko Ichinohe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    NSArray *_coffeeArray; //メンバ変数宣言
}

@property (weak, nonatomic) IBOutlet UILabel *coffeeTitle;

@property (nonatomic,assign) int select_num;

@property (weak, nonatomic) IBOutlet UITextView *descriptionText;

@end
