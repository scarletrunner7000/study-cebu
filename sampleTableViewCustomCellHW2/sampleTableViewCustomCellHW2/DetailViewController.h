//
//  DetailViewController.h
//  sampleTableViewCustomCellHW2
//
//  Created by inagaki on 2015/09/11.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface DetailViewController : UIViewController

@property NSDictionary *person;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *fromLabel;
@property (weak, nonatomic) IBOutlet UILabel *purposeLabel;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@property (weak, nonatomic) IBOutlet UITextView *resembleTextView;

@end
