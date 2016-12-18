//
//  DetailViewController.h
//  sampleTableView002HW
//
//  Created by inagaki on 2015/09/09.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, assign) NSInteger selectNum;
@property (nonatomic, assign) NSString *coffeeName;
@property (nonatomic, assign) NSString *coffeeDescription;
@property (nonatomic, assign) UIImage *coffeeImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
