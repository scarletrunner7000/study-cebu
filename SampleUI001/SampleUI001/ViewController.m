//
//  ViewController.m
//  SampleUI001
//
//  Created by Eriko Ichinohe on 2014/10/28.
//  Copyright (c) 2014年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.ボタンを右下に作成
    [self createButton];
    
    
    //2.水色の小さいビューを作成
    _backView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 250)];
    _backView.backgroundColor = [UIColor colorWithRed:0.192157 green:0.760784 blue:0.952941 alpha:1.0];
    [self.view addSubview:_backView];

    //3.水色のViewにテキストフィールドを載せる
    //テキストフィールドの初期化、位置、大きさの決定
    _myTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    
    _myTextField.backgroundColor = [UIColor grayColor];
    
    //4.テキストフィールドのReturnキーのイベントとメソッドtapReturnを関連付ける
    [_myTextField addTarget:self action:@selector(tapReturn) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [_backView addSubview:_myTextField];
    
    //ベースのViewにラベルを載せる
    _myLabelInput = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 200, 20)];
    
    [self.view addSubview:_myLabelInput];
    
    //最初は水色のViewが非表示なのでNOに設定
    _visibleFlag = NO;
}

-(void)createButton{

    _myButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 508, 40, 20)];
    
    [_myButton setTitle:@"Tap" forState:UIControlStateNormal];
    
    [_myButton setTitleColor:[UIColor colorWithRed:0.192157 green:0.760784 blue:0.952941 alpha:1.0] forState:UIControlStateNormal];
    
    [_myButton addTarget:self action:@selector(tapBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_myButton];


}

//tapされた時に反応するメソッド
-(void)tapBtn:(UIButton *)myButton{
    NSLog(@"Tap");
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    
    if (_visibleFlag) {
        //ボタン、ビューを下げる
        //ボタンを垂直に下げる
        myButton.frame = CGRectMake(280, 508, 40, 20);
        
        //ビューを下げる（非表示）
        _backView.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 250);
        _visibleFlag = NO;
    }else{
        //ボタン、ビューを上げる
        //ボタンを垂直に上げる
        myButton.frame = CGRectMake(280, 278, 40, 20);
        
        //水色のビューも上げる
        _backView.frame = CGRectMake(0, self.view.bounds.size.height-250, self.view.bounds.size.width, 250);
        
        _visibleFlag = YES;
    }

    
    [UIView commitAnimations];
}

-(void)tapReturn{
    NSLog(@"tapReturn");
    _myLabelInput.text = _myTextField.text;
    
    //TODO:ボタンと水色のビューをこのタイミングで下げる
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
