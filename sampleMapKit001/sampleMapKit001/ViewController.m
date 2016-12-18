//
//  ViewController.m
//  sampleMapKit001
//
//  Created by inagaki on 2015/09/17.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // MapView オブジェクトを生成
    MKMapView *mapView = [[MKMapView alloc] init];
    
    // デリゲート
    mapView.delegate = self;
    
    // 大きさ、位置を決定
    mapView.frame = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height - 20);
    
    // 表示位置を設定
    CLLocationCoordinate2D co;
    // アヤラの位置を設定
    co.latitude = 10.317347; //緯度
    co.longitude = 123.905759; //軽度
    [mapView setCenterCoordinate:co];
    
    // 縮尺を設定
    MKCoordinateRegion cr = mapView.region;
    // 地図の範囲を指定（軽度）
    cr.span.latitudeDelta = 0.05;
    // 地図の範囲を指定（緯度）
    cr.span.longitudeDelta = 0.05;
    cr.center = co;
    [mapView setRegion:cr];
    
    // 地図の表示の種類設定
    mapView.mapType = MKMapTypeStandard;
    
    // 表示するために View に追加
    [self.view addSubview:mapView];
    
    // ピンを立てる
    [self addPinOn:mapView title:@"Ayala" subtitle:@"セブで一番大きい"
                at:CLLocationCoordinate2DMake(10.317347, 123.905759)];
    [self addPinOn:mapView title:@"SM Mall" subtitle:@"セブで二番目に大きい"
                at:CLLocationCoordinate2DMake(10.311715, 123.918332)];
    [self addPinOn:mapView title:@"2QUAD" subtitle:@"NexSeed はこの12階"
                at:CLLocationCoordinate2DMake(10.3142719, 123.9053564)];
    [self addPinOn:mapView title:@"La Guardia Flat 2" subtitle:@"我々のすみか"
                at:CLLocationCoordinate2DMake(10.3274358,123.9055837)];

}

- (void)addPinOn:(MKMapView *)mapView
           title:(NSString *)title
        subtitle:(NSString *)subtitle
              at:(CLLocationCoordinate2D)coordinate {
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = coordinate;
    pin.title = title;
    pin.subtitle = subtitle;
    [mapView addAnnotation:pin];
}

// ピンを表示する際に発動されるデリゲートメソッド
// ピンが降ってくるアメーションを追加する
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    static NSString *pinIdentifier = @"PinAnnotationID";
    
    MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pinIdentifier];
    
    if (pinView == nil) {
        // 初期化
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pinIdentifier];
        
        // 落ちるアニメーションの設定
        pinView.animatesDrop = YES;
        // 吹き出しの設定
        pinView.canShowCallout = YES;
    }
    
    return pinView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
