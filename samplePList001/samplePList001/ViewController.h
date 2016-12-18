//
//  ViewController.h
//  samplePList001
//
//  Created by inagaki on 2015/09/21.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property NSArray *areaList;

@end

