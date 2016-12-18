//
//  CustomTableViewCell.h
//  sampleTableViewCustomCellHW2
//
//  Created by inagaki on 2015/09/11.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *englishProgressView;

@end
