//
//  DetailViewController.h
//  SampleTableView003
//
//  Created by Eriko Ichinohe on 2014/10/21.
//  Copyright (c) 2014年 Eriko Ichinohe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (nonatomic,assign)int selectNum;

- (IBAction)tapBack:(id)sender;

@end
