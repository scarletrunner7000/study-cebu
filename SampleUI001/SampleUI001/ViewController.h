//
//  ViewController.h
//  SampleUI001
//
//  Created by Eriko Ichinohe on 2014/10/28.
//  Copyright (c) 2014年 Eriko Ichinohe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UIView *_backView; //水色のビュー用メンバ変数
    BOOL _visibleFlag;  //水色のビューが表示されている:YES 非表示:NO
    UITextField *_myTextField; //水色ビュー用テキストフィールド
    
    UILabel *_myLabelInput; //入力された文字を表示する
    UIButton *_myButton;
    
    
}

@end

