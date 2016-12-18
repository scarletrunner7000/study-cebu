//
//  DetailViewController.m
//  sampleTableViewCustomCellHW2
//
//  Created by inagaki on 2015/09/11.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <ADBannerViewDelegate> {
    ADBannerView *_adView;
    BOOL _isVisible;
}

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _nameLabel.text = _person[@"name"];
    _mainImageView.image = _person[@"image"];
    _ageLabel.text = _person[@"age"];
    _fromLabel.text = _person[@"from"];
    _purposeLabel.text = _person[@"purpose"];
    _progressLabel.text = _person[@"progress"];
    _resembleTextView.text = _person[@"resemble"];
    
    // 初期化
    _adView = [[ADBannerView alloc] init];
    
    // 配置場所を決定
    _adView.frame = CGRectMake(0, -_adView.frame.size.height, _adView.frame.size.width, _adView.frame.size.height);
    
    // 透明にセット
    _adView.alpha = 0.0;
    
    // delegate
    _adView.delegate = self;
    
    // 画面本体に追加
    [self.view addSubview:_adView];
    
    // 最初はバナーが表示されていなないので表示フラグを NO にする。
    _isVisible = NO;
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
    if (!_isVisible) {
        // バナーを見える場所に配置
        [UIView beginAnimations:@"animateAdBannerOn" context:nil];
        
        [UIView setAnimationDuration:0.3];
        
        banner.frame = CGRectOffset(banner.frame, 0, CGRectGetHeight(banner.frame)
                                    + self.navigationController.navigationBar.bounds.size.height);
        banner.alpha = 1.0;
        
        [UIView commitAnimations];
        
        // 表示フラグを変更
        _isVisible = YES;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    
    // バナーが表示されていたら隠す
    if (_isVisible) {
        // バナーを見えない場所に配置
        [UIView beginAnimations:@"animateAdBannerOff" context:nil];
        
        [UIView setAnimationDuration:0.3];
        
        banner.frame = CGRectMake(0, -_adView.frame.size.height, _adView.frame.size.width, _adView.frame.size.height);
        banner.alpha = 0.0;
        
        [UIView commitAnimations];
        
        // 表示フラグを変更
        _isVisible = NO;
    }
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

@end
