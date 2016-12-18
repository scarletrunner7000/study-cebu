//
//  AreaViewController.h
//  samplePListHW
//
//  Created by inagaki on 2015/09/21.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AreaViewController : UIViewController

@property NSInteger no;
@property NSString *name;
@property NSArray *friendsList;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextView *friendsTextView;

- (IBAction)backButtonDidTap:(id)sender;

@end
