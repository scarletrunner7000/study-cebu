//
//  ViewController.h
//  SampleCoreDataFriends
//
//  Created by Eriko Ichinohe on 2015/04/24.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_areaArray;
}

@property (weak, nonatomic) IBOutlet UITableView *areaTableView;


@end

