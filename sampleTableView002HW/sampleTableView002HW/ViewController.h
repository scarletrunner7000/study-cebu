//
//  ViewController.h
//  sampleTableView002HW
//
//  Created by inagaki on 2015/09/09.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSArray *_coffeeNames;
    NSArray *_coffeeDescriptions;
    NSArray *_coffeeImages;
}
@property (weak, nonatomic) IBOutlet UITableView *coffeeTableView;

@end

