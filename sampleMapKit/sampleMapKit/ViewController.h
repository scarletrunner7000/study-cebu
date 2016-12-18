//
//  ViewController.h
//  sampleMapKit
//
//  Created by Eriko Ichinohe on 2015/09/17.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>

@property (nonatomic) CLLocationManager *locationManager;

@end

