//
//  ViewController.h
//  sampleTableView003
//
//  Created by inagaki on 2015/09/10.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSArray *_programmings;
}

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

