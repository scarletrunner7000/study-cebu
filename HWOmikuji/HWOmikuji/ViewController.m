//
//  ViewController.m
//  HWOmikuji
//
//  Created by Eriko Ichinohe on 2015/01/26.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate>
{
    int _randomNumber;  //メンバ変数宣言
    
}


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

- (IBAction)tapBtnOmikuji:(id)sender {
    
    //おみくじの種類を配列に保存
    NSArray *omikuji = @[@"大吉",@"吉",@"中吉",@"小吉",@"末吉",@"凶",@"大凶"];
    
    //ランダムで選択肢いずれかのインデックス番号を取得
    _randomNumber = arc4random() % omikuji.count;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"今日の運勢" message:omikuji[_randomNumber] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    NSLog(@"buttonIndex=%ld",(long)buttonIndex);
    
    NSLog(@"%d",_randomNumber);
    
    //引いたおみくじによって結果のラベルに表示される文字を変更する
    switch (_randomNumber) {
        case 0:
            //大吉
            self.resultLabel.text = @"今日はあなたが主役！";
            break;
        case 1:
            //吉
            self.resultLabel.text = @"吉って中吉より幸運！";
            break;
        case 2:
            //中吉
            self.resultLabel.text = @"中間が一番幸せって考えもある";
            break;
        case 3:
            //小吉
            self.resultLabel.text = @"チョコがラッキーアイテム";
            break;
        case 4:
            //末吉
            self.resultLabel.text = @"凶を免れる運があります";
            break;
        case 5:
            //凶
            self.resultLabel.text = @"明日引いたらきっと大吉";
            break;
        case 6:
            //大凶
            self.resultLabel.text = @"温かいお茶を飲もう";
            break;
        default:
            //それ以外の数字が万一入ってしまった時のための処理
            self.resultLabel.text = @"謎みくじ";
            break;
    }
    
    
}
@end
