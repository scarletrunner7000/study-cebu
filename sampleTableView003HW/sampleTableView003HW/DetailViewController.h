//
//  DetailViewController.h
//  sampleTableView003HW
//
//  Created by inagaki on 2015/09/10.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *kanaLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (nonatomic, assign) NSInteger selectedNum;

- (IBAction)backButtonDidTapped:(id)sender;

@end
