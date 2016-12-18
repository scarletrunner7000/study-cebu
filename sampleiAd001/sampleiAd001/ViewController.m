//
//  ViewController.m
//  sampleiAd001
//
//  Created by inagaki on 2015/09/15.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <ADBannerViewDelegate> {
    ADBannerView *_adView; // バナーオブジェクト
    BOOL _isVisible; // バナーの表示状態を判別するためのフラグ
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // バナーを配置する
    
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

// バナーが正常に配信された場合
- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
    if (!_isVisible) {
        // バナーを見える場所に配置
        [UIView beginAnimations:@"animateAdBannerOn" context:nil];
        
        [UIView setAnimationDuration:0.3];
        
        banner.frame = CGRectOffset(banner.frame, 0, CGRectGetHeight(banner.frame));
        banner.alpha = 1.0;
        
        [UIView commitAnimations];
        
        // 表示フラグを変更
        _isVisible = YES;
    }
}

// 広告が正常に配信されなかった場合
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

@end
