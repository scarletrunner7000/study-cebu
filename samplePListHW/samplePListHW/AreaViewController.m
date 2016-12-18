//
//  AreaViewController.m
//  samplePListHW
//
//  Created by inagaki on 2015/09/21.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "AreaViewController.h"

@interface AreaViewController ()

@end

@implementation AreaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIFont *font = [UIFont fontWithName:@"HiraKakuProN-W3" size:17.f];
//    [_friendsTextView.attributedText enumerateAttributesInRange:NSMakeRange(0, 1) options:0 usingBlock:^(NSDictionary *attrs, NSRange range, BOOL *stop) {
//        [defaultAttrs addEntriesFromDictionary:attrs];
//    }];
    NSMutableAttributedString *friendsAttrStr = [[NSMutableAttributedString alloc] initWithString:@""];
    if (_friendsList.count > 0) {
        for (NSDictionary *friend in _friendsList) {
            NSString *friendStr = [NSString stringWithFormat:@"%@\t(%@)\t%@\n",
                                   friend[@"Name"], friend[@"Age"], friend[@"Gender"]];
            UIColor *color = ([friend[@"Gender"] isEqualToString:@"男"]) ? [UIColor blueColor] : [UIColor magentaColor];
            NSDictionary *attributes = @{NSFontAttributeName:font,
                                         NSForegroundColorAttributeName:color};
            NSAttributedString *friendAttrStr = [[NSAttributedString alloc] initWithString:friendStr attributes:attributes];
            [friendsAttrStr appendAttributedString:friendAttrStr];
        }
    } else {
        [friendsAttrStr appendAttributedString:[[NSAttributedString alloc] initWithString:@"友達の登録がありません。" attributes:@{NSFontAttributeName:font}]];
    }
    
    _nameLabel.text = [_name stringByAppendingFormat:@" の友達 (%ld人)", _friendsList.count];
    _friendsTextView.attributedText = friendsAttrStr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backButtonDidTap:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
