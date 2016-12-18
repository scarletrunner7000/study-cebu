//
//  ViewController.m
//  SampleiAd
//
//  Created by Eriko Ichinohe on 2014/10/22.
//  Copyright (c) 2014年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<ADBannerViewDelegate>
{
    ADBannerView *_adView; //バナーオブジェクト
    BOOL _isVisible;  //バナーの表示状態を判別するためのフラグ
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初期化
    _adView = [[ADBannerView alloc] init];

    //場所を決定
    _adView.frame = CGRectMake(0, -_adView.frame.size.height, _adView.frame.size.width, _adView.frame.size.height);
    
    //透明にセット
    _adView.alpha = 0.0;
    
    
    _adView.delegate = self;
    
    //画面本体に追加
    [self.view addSubview:_adView];
    
    //バナーは表示されていないのでNOを設定
    _isVisible = NO;
    
}
//バナーが正常に表示された場合
-(void)bannerViewDidLoadAd:(ADBannerView *)banner{
    
    if (!_isVisible) {

        [UIView beginAnimations:@"animateAdBannerOn" context:nil];
        [UIView setAnimationDuration:0.3];
        
        banner.frame = CGRectOffset(banner.frame, 0, CGRectGetHeight(banner.frame));
        banner.alpha = 1.0;
        [UIView commitAnimations];
        
        //バナーを表示しているのでYESを設定
        _isVisible = YES;

    
    }
}

//バナー表示でエラーが発生した場合
-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{

    if (_isVisible) {
        
        [UIView beginAnimations:@"animateAdBannerOff" context:nil];
        [UIView setAnimationDuration:0.3];
        
        _adView.frame = CGRectMake(0, -_adView.frame.size.height, _adView.frame.size.width, _adView.frame.size.height);
        
        banner.alpha = 0.0;
        
        [UIView commitAnimations];
        
        //バナーを非表示にしているのでNOを設定
        _isVisible = NO;
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
