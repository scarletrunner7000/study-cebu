//
//  ViewController.m
//  SampleActionSheet
//
//  Created by Eriko Ichinohe on 2014/10/15.
//  Copyright (c) 2014年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.myButton setTitle:@"どのアクティビティにする？" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapBtn:(id)sender {
    
    //アクションシートの初期化
    UIActionSheet *actionSheet = [[UIActionSheet alloc] init];
    
    //タイトルの設定
    actionSheet.title = @"今週のアクティビティ";
    
    actionSheet.delegate = self;
    
    [actionSheet addButtonWithTitle:@"ムエタイ"];
    [actionSheet addButtonWithTitle:@"ヨガ"];
    [actionSheet addButtonWithTitle:@"バスケ"];
    
    [actionSheet addButtonWithTitle:@"キャンセル"];
    
    [actionSheet addButtonWithTitle:@"ボルタリング"];
    
    [actionSheet setDestructiveButtonIndex:1];
    [actionSheet setCancelButtonIndex:3];
    [actionSheet showInView:self.view];
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{

    switch (buttonIndex) {
        case 0:
            NSLog(@"ムエタイ");
            //TODO:メッセージ表示「So,hard!Enjoy!!」
            self.myLabel.text = @"So,hard!Enjoy!!";
            break;
        case 1:
            NSLog(@"ヨガ");
            //TODO:メッセージ表示「Enjoy,yoga!!」
            
            break;
        case 2:
            NSLog(@"バスケ");
            //TODO:メッセージ表示「Enjoy,basketball」

            break;
        case 3:
            NSLog(@"キャンセル");
            //TODO:メッセージ表示「See you next time!」

            break;
        default:
            NSLog(@"何か押されました");
            //TODO:メッセージ表示「Enjoy,anyway!」

            break;
    }


}
@end
