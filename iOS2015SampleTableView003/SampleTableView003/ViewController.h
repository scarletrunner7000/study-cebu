//
//  ViewController.h
//  SampleTableView003
//
//  Created by Eriko Ichinohe on 2014/10/21.
//  Copyright (c) 2014年 Eriko Ichinohe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_programmingArray; //メンバ変数宣言
}


@property (weak, nonatomic) IBOutlet UITableView *proTableView;


@end

