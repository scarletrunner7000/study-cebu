//
//  ViewController.m
//  sampleMapKit
//
//  Created by Eriko Ichinohe on 2015/09/17.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    MKMapView *_mapView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    //MapViewオブジェクトを生成
    _mapView = [[MKMapView alloc] init];
    
    //デリゲートを設定
    _mapView.delegate = self;
    
    //大きさ、位置を決定
    _mapView.frame = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height-20);
    
    //表示位置を設定
    CLLocationCoordinate2D co;
    
    //アヤラの位置を設定
    co.latitude = 10.317347; //緯度
    co.longitude = 123.905759;  //経度
    
    [_mapView setCenterCoordinate:co];
    
    //縮尺を指定
    MKCoordinateRegion cr = _mapView.region;
    
    //地図の範囲を指定（緯度）
    cr.span.latitudeDelta = 0.02;
    
    //地図の範囲を指定（経度)
    cr.span.longitudeDelta = 0.02;
    
    cr.center = co;
    
    [_mapView setRegion:cr];
    
    //地図の表示種類設定
    _mapView.mapType = MKMapTypeStandard;
    
    //ピンを立てる
    //アヤラ
    MKPointAnnotation *pin =[[MKPointAnnotation alloc] init];
    pin.coordinate = CLLocationCoordinate2DMake(10.317347, 123.905759);
    
    pin.title = @"Ayala";
    pin.subtitle = @"セブで一番大きい";
    
    [_mapView addAnnotation:pin];
    
    MKPointAnnotation *pin2 =[[MKPointAnnotation alloc] init];
    pin2.coordinate = CLLocationCoordinate2DMake(10.311715, 123.918332);
    pin2.title = @"Shumart";
    pin2.subtitle = @"セブで二番目に大きい";

    [_mapView addAnnotation:pin2];
    
    MKPointAnnotation *pin3 =[[MKPointAnnotation alloc] init];
    pin3.coordinate = CLLocationCoordinate2DMake(10.314276, 123.90535);
    pin3.title = @"2Quad";
    pin3.subtitle = @"NexSeed";
    
    [_mapView addAnnotation:pin3];
    
    //現在位置を表示する
    _mapView.showsUserLocation = YES;
    
    //表示するためにViewに追加
    [self.view addSubview:_mapView];
    
}

//ピンを表示する際に発動されるデリゲートメソッド
//ピンが降ってくるアニメーションの設定
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
   
    // 現在地表示なら nil を返す
    if (annotation == mapView.userLocation) {
        return nil;
    }
    static NSString *pinIdentifier = @"PinAnnotationID";

    //ピン情報の再利用
    MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pinIdentifier];
    
    if (pinView == nil) {
        //初期化
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pinIdentifier];
        
        if ([annotation.title isEqualToString:@"Ayala"]) {
            //落ちるアニメーションの設定
            pinView.animatesDrop = YES;
            
        }else{
            //落ちない設定
            pinView.animatesDrop = NO;

        }
        
        //吹き出しの設定
        pinView.canShowCallout = YES;
    }
    
    return pinView;
}

/*
 CLLocationManagerDelegate
 */
//位置情報更新時に呼ばれる
//- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
//{
//    //ユーザの位置を表示するかどうか
//    _mapView.showsUserLocation = YES;
//    
////    //最新の位置情報を取得し、そこからマップの中心座標を決定
////    CLLocation *currentLocation = locations.lastObject;
////    CLLocationCoordinate2D centerCoordinate = currentLocation.coordinate;
////    //縮尺度を指定
////    MKCoordinateSpan coordinateSpan = MKCoordinateSpanMake(0.03, 0.03); //数が小さいほど拡大率アップ
////    
////    //設定した縮尺で現在地を中心としたマップをセット（初回1回のみ）
////    if (_alreadyStartingCoordinateSet == NO) {
////        MKCoordinateRegion newRegion = MKCoordinateRegionMake(centerCoordinate, coordinateSpan);
////        [_mapView setRegion:newRegion animated:YES];
////        _alreadyStartingCoordinateSet = YES;
////    }
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
