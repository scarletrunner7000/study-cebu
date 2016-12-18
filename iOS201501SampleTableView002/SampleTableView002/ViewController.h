//
//  ViewController.h
//  SampleTableView002
//
//  Created by Eriko Ichinohe on 2015/01/14.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_coffeeArray; //メンバ変数宣言
}

@property (weak, nonatomic) IBOutlet UITableView *myTableView;


@end

