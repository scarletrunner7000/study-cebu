//
//  ViewController.h
//  sampleTableView002
//
//  Created by inagaki on 2015/09/08.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSArray *_coffeeNames;
    NSArray *_coffeeDescriptions;
}

@property (weak, nonatomic) IBOutlet UITableView *coffeeTableView;

@end

