//
//  ViewController.h
//  SampleTableView002
//
//  Created by Eriko Ichinohe on 2014/10/20.
//  Copyright (c) 2014年 Eriko Ichinohe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_coffeeArray; //メンバ変数宣言
}

@property (weak, nonatomic) IBOutlet UITableView *coffeeListTableView;


@end

