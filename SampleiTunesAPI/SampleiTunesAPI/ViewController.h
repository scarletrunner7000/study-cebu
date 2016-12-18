//
//  ViewController.h
//  SampleiTunesAPI
//
//  Created by Eriko Ichinohe on 2015/05/21.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property(nonatomic) AVAudioPlayer *audioPlayer;


@end

