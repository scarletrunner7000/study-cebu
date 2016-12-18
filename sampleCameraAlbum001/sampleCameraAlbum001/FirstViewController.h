//
//  FirstViewController.h
//  sampleCameraAlbum001
//
//  Created by inagaki on 2015/09/18.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface FirstViewController : UIViewController {
    NSString *_assetsUrl; // assetsUrl を格納するインスタンス
    ALAssetsLibrary *_library; // ALAssetsLibrary のインスタンス
}

@property (weak, nonatomic) IBOutlet UIImageView *previewImage;

- (IBAction)tapChoosePhoto:(id)sender;

@end

