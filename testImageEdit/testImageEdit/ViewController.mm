//
//  ViewController.m
//  testImageEdit
//
//  Created by inagaki on 2015/10/04.
//  Copyright © 2015年 inagaki. All rights reserved.
//

#import "ViewController.h"
#import <opencv2/opencv.hpp>
#import <opencv2/highgui/ios.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testButton:(id)sender {
    _testImageView.layer.shouldRasterize = YES;  //レイヤーをラスタライズする
    _testImageView.layer.rasterizationScale = 0.2;  //ラスタライズ時の縮小率
    _testImageView.layer.minificationFilter = kCAFilterTrilinear;  //縮小時のフィルタ種類
    _testImageView.layer.magnificationFilter = kCAFilterNearest;  //【追加】拡大時のフィルタ種類をニアレストネイバーに

}

- (IBAction)testButton2:(id)sender {
    _testImageView.image = [self binarize:_testImageView.image];
}

- (UIImage *)binarize:(UIImage *)srcImage{
    
    cv::Mat src_img;
    UIImageToMat(srcImage, src_img);
    cv::Mat gray_img, bin_img;
    cv::cvtColor(src_img, gray_img, CV_RGB2GRAY);
    cv::threshold(gray_img, bin_img, 128, 255, CV_THRESH_BINARY);
    
    return MatToUIImage(bin_img);
}

@end
