//
//  FirstViewController.m
//  sampleCameraAlbum001
//
//  Created by inagaki on 2015/09/18.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ライブラリオブジェクトの初期化
    if (_library == nil) {
        _library = [[ALAssetsLibrary alloc] init];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// カメラロールから画像を選ぶ
- (IBAction)tapChoosePhoto:(id)sender {
    // 機能のタイプを設定する
    // 初期化
    UIImagePickerControllerSourceType sourcetype = -1;
    sourcetype = UIImagePickerControllerSourceTypePhotoLibrary;
    
    // カメラロール機能が使えなかったら処理を中断
    if (![UIImagePickerController isSourceTypeAvailable:sourcetype]) {
        return;
    }
    
    // イメージピッカーの生成
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = sourcetype;
    imagePicker.delegate = (id)self;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

// 写真を選んだ時
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    // カメラライブラリから選んだ写真の URL を取得
    _assetsUrl = [(NSURL *)[info objectForKey:@"UIImagePickerControllerReferenceURL"] absoluteString];
    
    // URL から ALAsset を取得
    [_library assetForURL:[NSURL URLWithString:_assetsUrl] resultBlock:^(ALAsset *asset){
        // 画像があるかチェック
        if (asset) {
            NSLog(@"データがあります");
            // 写真データを取得する
            ALAssetRepresentation *assetRep = [asset defaultRepresentation];
            UIImage *fullScreenImage = [UIImage imageWithCGImage:[assetRep fullResolutionImage]];
            
            self.previewImage.image = fullScreenImage;
        } else {
            NSLog(@"データがありません");
        }
    } failureBlock:nil];
    
    // 元の画面に戻る
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
