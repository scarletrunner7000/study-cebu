//
//  customTableViewCell.h
//  sampleTableViewCustomCell
//
//  Created by inagaki on 2015/09/10.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *myCustomCell;
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *subImageView;

@end
