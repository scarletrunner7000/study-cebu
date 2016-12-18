//
//  ViewController.m
//  SampleiTunesAPI
//
//  Created by Eriko Ichinohe on 2015/05/21.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"


@interface ViewController (){
    NSArray *_musicList;
    NSMutableArray *_musicPlay;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/wa/wsSearch?term=mr+children&country=JP&entity=musicTrack&limit=25"]];
    NSData *json_data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSError *error = nil;
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:json_data options:NSJSONReadingAllowFragments error:&error];
    
    _musicList = jsonObject[@"results"];
    NSLog(@"%@",_musicList);
    NSLog(@"%lu",_musicList.count);
    
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    _audioPlayer = nil;
    
}

//行数を決定するメソッド
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _musicList.count;
}

//行に表示するデータの作成
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    
    //再利用可能なCellオブジェクトを作成
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = _musicList[indexPath.row][@"trackName"];
    cell.imageView.image = [UIImage imageNamed:@"sound.jpg"];
    cell.imageView.userInteractionEnabled = YES;
    cell.imageView.tag = indexPath.row;
    
    
    return cell;
    
}

//行が押された時に発動するメソッド
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"%ld",(long)indexPath.row);
    
    //音を出す
    NSError *error = nil;
    
    
    //パスから再生プレイヤーを作成する
    NSURL *url =[NSURL URLWithString:_musicList[indexPath.row][@"previewUrl"]];
    
    
    //audioを再生するプレイヤーを作成する
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    if (_audioPlayer == nil) {
        _audioPlayer = [[AVAudioPlayer alloc] initWithData:data error:&error];
        
        
        //エラーが起きたとき
        if (error !=nil) {
            NSLog(@"Error %@",[error localizedDescription]);
        }else{
            //自分自身をデリケートに設定
            [_audioPlayer setDelegate:self];
            [_musicPlay addObject:_audioPlayer];
        }

    }
    
    
    if (_audioPlayer.playing) {
        [_audioPlayer stop];
        _audioPlayer = nil;
    }else{
        [_audioPlayer play];
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
