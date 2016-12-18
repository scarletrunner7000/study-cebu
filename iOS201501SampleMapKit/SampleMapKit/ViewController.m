//
//  ViewController.m
//  SampleMapKit
//
//  Created by Eriko Ichinohe on 2015/01/19.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //MapViewオブジェクトを作成
    MKMapView *mapView = [[MKMapView alloc] init];
    
    //delegate設定
    mapView.delegate = self;
    
    //大きさ、位置を決定
    mapView.frame = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height - 20);
    
    //表示位置の中心を設定
    CLLocationCoordinate2D co;
    
    //アヤラの位置を設定
    co.latitude = 10.317347;    //緯度
    co.longitude = 123.905759;  //経度
    
    [mapView setCenterCoordinate:co];
    
    //縮尺を設定
    MKCoordinateRegion cr = mapView.region;
    cr.span.latitudeDelta = 0.08; //数字を小さくすると、詳細な地図（範囲がせまい）になる
    cr.span.longitudeDelta = 0.08;
    
    cr.center = co;
    
    [mapView setRegion:cr];
    
    //地図の表示種類設定
    mapView.mapType = MKMapTypeHybrid;
    
    //現在地を表示
    mapView.showsUserLocation = YES;
    
    //アヤラにピンを立てる
//    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
//    pin.coordinate = CLLocationCoordinate2DMake(co.latitude, co.longitude);
//    pin.title = @"アヤラ";
//    pin.subtitle = @"biggest Shopping Mall in Cebu";

    MKPointAnnotation *pin = [self createdPin:co Title:@"アヤラ" Subtitle:@"biggest Shopping Mall in Cebu"];
    
    
    [mapView addAnnotation:pin];
    
    //SMモール
    CLLocationCoordinate2D co2;
    co2.latitude =10.314872;
    co2.longitude =123.90273;
    
    MKPointAnnotation *pin2 =[self createdPin:co2 Title:@"SM" Subtitle:@"Next Mall"];
    [mapView addAnnotation:pin2];

    
    //表示するためにViewに追加
    [self.view addSubview:mapView];
}

//ピンを立てる自作メソッド
-(MKPointAnnotation *)createdPin:(CLLocationCoordinate2D)co Title:(NSString *)title Subtitle:(NSString *)subtitle{

    MKPointAnnotation *pin = [[MKPointAnnotation alloc]init];
    pin.coordinate = co;
    pin.title = title;
    pin.subtitle = subtitle;
    
    return pin;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
