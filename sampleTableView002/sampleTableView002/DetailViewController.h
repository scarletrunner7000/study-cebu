//
//  DetailViewController.h
//  sampleTableView002
//
//  Created by inagaki on 2015/09/08.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, assign) int selectNum;

@end
