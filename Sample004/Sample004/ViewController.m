//
//  ViewController.m
//  Sample004
//
//  Created by Shinya Hirai on 2015/07/10.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    self.myTextField.delegate = self;
    
    // if文
    int i = 0;
//    NSString *str;
//    
//    if (str) {
//        
//    }
    
    if (i != 0) {
        // 処理
        NSLog(@"正しい");
    } else if (i == 0) {
        
    } else if (i == 1) {
        
    }
    
    // switch
    int dice = 1;
    switch(dice) {
        case 1:
            NSLog(@"振り出しに戻る");
            break;
        case 6:
            NSLog(@"もう一回振ります");
            break;
        default:
            NSLog(@"出た目の数だけ進む");
            break;
    }
    
    // while
    int d = 0;
    int e = 0;
    while (d < 100) {
        d += 7;
        e += 1;
//        NSLog(@"d = %d",d);
//        NSLog(@"e = %d",e);
    }
    
    // for
    int a = 0;
    for (int i = 1; i <= 10; i++) {
        // 自己代入
        a += i; // a = a + i;
        if (i == 5) {
            NSLog(@"ほげほげ");
        }
    }
    NSLog(@"<%d>",a);
    
    
    // 実践問題
    NSArray *ary = @[@"Marina",@"Takuya",@"Tomo",@"Tetsuya",@"Yoshiro",@"Shinya"];
    NSLog(@"%lu",(unsigned long)ary.count);
    
    // for文使う
    // ary配列を繰り返して全件nslogで表示する
    
    // Tomoのときだけ、nslogで表示する
    int countAry = ary.count;
    
    for (int i = 0; i < countAry; i++) {
        NSLog(@"%@",ary[i]);
        
        if ([ary[i] isEqualToString: @"Tomo"]) {
            NSLog(@"いがわはるか");
        }
    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)inputText:(id)sender {
    self.myLabel.text = self.myTextField.text;
}

- (IBAction)tapBtn:(id)sender {
    NSLog(@"tap");
    // キーボートを閉じる
    [self.myTextField resignFirstResponder];
    
    UILabel *myLabel2 = [[UILabel alloc] init];
    myLabel2.frame = CGRectMake(100, 100, 200, 60);
    myLabel2.text = @"ほげほげ";
    [self.view addSubview:myLabel2];

}

- (IBAction)chageSlider:(id)sender {
    self.myLabel.text = [NSString stringWithFormat:@"%f",self.mySlider.value];
}
@end
