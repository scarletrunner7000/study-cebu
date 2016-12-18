//
//  FriendsViewController.h
//  SampleCoreDataFriends
//
//  Created by Eriko Ichinohe on 2015/04/24.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Friend.h"

@interface FriendsViewController : UIViewController<UINavigationControllerDelegate>

@property (nonatomic,assign)int areaNum;
@property (nonatomic,strong)NSString *areaString;
@property (weak, nonatomic) IBOutlet UITableView *friendsTable;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd;
- (IBAction)tapBtnAdd:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *friendNameText;

@end
