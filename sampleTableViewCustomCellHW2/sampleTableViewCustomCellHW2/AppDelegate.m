//
//  AppDelegate.m
//  sampleTableViewCustomCellHW2
//
//  Created by inagaki on 2015/09/11.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _people = @[
                @{@"name":@"仁木甫",
                  @"image":[UIImage imageNamed:@"hajime_niki.jpg"],
                  @"age":@"26歳",
                  @"from":@"愛知県",
                  @"purpose":@"アメリカに行く",
                  @"progress":@"6",
                  @"resemble":@"鄭大世"
                  },
                @{@"name":@"脇田竜馬",
                  @"image":[UIImage imageNamed:@"ryoma_wakita.jpg"],
                  @"age":@"25歳",
                  @"from":@"兵庫県",
                  @"purpose":@"ゆっくり本読みたい",
                  @"progress":@"5",
                  @"resemble":@"宇治木剛"
                  },
                @{@"name":@"田中良知",
                  @"image":[UIImage imageNamed:@"ryochi_tanaka.jpg"],
                  @"age":@"22歳",
                  @"from":@"京都府",
                  @"purpose":@"豪遊",
                  @"progress":@"3",
                  @"resemble":@"テラスハウスのてっちゃん、イチロー、伊藤英明、市原隼人を全てたして20で割ったくらいの顔"
                  },
                @{@"name":@"一戸英理子",
                  @"image":[UIImage imageNamed:@"eriko_ichinohe.jpg"],
                  @"age":@"36歳",
                  @"from":@"青森県",
                  @"purpose":@"ムエタイ",
                  @"progress":@"7",
                  @"resemble":@"水川あさみをぽっちゃりさせた感じ"
                  },
                @{@"name":@"谷山卓朗",
                  @"image":[UIImage imageNamed:@"takuro_taniyama.jpg"],
                  @"age":@"23歳",
                  @"from":@"佐賀県",
                  @"purpose":@"何もしない",
                  @"progress":@"3",
                  @"resemble":@"くみっきー"
                  },
                @{@"name":@"男庭雪乃",
                  @"image":[UIImage imageNamed:@"yukino_oniwa.jpg"],
                  @"age":@"28歳",
                  @"from":@"千葉県",
                  @"purpose":@"愛犬に会いたい",
                  @"progress":@"1",
                  @"resemble":@"はるな愛"
                  },
                @{@"name":@"稲垣悠一",
                  @"image":[UIImage imageNamed:@"yuichi_inagaki.jpg"],
                  @"age":@"21歳",
                  @"from":@"愛知県",
                  @"purpose":@"鴨川をいかだで下る",
                  @"progress":@"3",
                  @"resemble":@"厚切りジェイソン"
                  },
                @{@"name":@"山本援",
                  @"image":[UIImage imageNamed:@"en_yamamoto.jpg"],
                  @"age":@"28歳",
                  @"from":@"兵庫県",
                  @"purpose":@"日本経済について考える",
                  @"progress":@"5",
                  @"resemble":@"ピスタチオの左"
                  },
                @{@"name":@"川端杏奈",
                  @"image":[UIImage imageNamed:@"anna_kawabata.jpg"],
                  @"age":@"24歳",
                  @"from":@"福井県",
                  @"purpose":@"全身脱毛",
                  @"progress":@"2",
                  @"resemble":@"若槻千夏"
                  },
                @{@"name":@"近藤康平",
                  @"image":[UIImage imageNamed:@"kohei_kondo.jpg"],
                  @"age":@"22歳",
                  @"from":@"岐阜県",
                  @"purpose":@"起業",
                  @"progress":@"0.3",
                  @"resemble":@"細木数子"
                  },
                @{@"name":@"宮本楊子",
                  @"image":[UIImage imageNamed:@"img01.jpg"],
                  @"age":@"20歳",
                  @"from":@"熊本県",
                  @"purpose":@"味噌スープ飲みたい",
                  @"progress":@"0",
                  @"resemble":@""
                  }
                ];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
