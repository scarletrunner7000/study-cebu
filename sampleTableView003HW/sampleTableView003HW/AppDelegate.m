//
//  AppDelegate.m
//  sampleTableView003HW
//
//  Created by inagaki on 2015/09/10.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 表示用の連想配列を準備
    _dicArray = @[@{@"title":@"C言語",
                    @"kana":@"シーげんご",
                    @"desc":@"C言語（シーげんご）は、1972年にAT&Tベル研究所のデニス・リッチーが主体となって開発したプログラミング言語である。英語圏では単に C と呼んでおり、日本でも文書や文脈によっては同様に C と呼ぶことがある。\nUNIXおよび C コンパイラの移植性を高めるために開発してきた経緯から、オペレーティングシステムカーネルおよびコンパイラ向けの低レベル記述ができることを特徴としている。"},
                   @{@"title":@"Objective-C",
                     @"kana":@"オブジェクティブ シー",
                     @"desc":@"Objective-C（オブジェクティブ シー）は、プログラミング言語の一種。C言語をベースにSmalltalk型のオブジェクト指向機能を持たせた上位互換言語である。\nObjective-CはNeXT、Mac OS XのOSに標準付属する公式開発言語である。OS Xのパッケージ版に開発環境がDVDで付属するほか、ユーザ登録をすれば無償でダウンロードできる（Xcodeの項目参照）。現在では主にアップルのMac OS XやiOS上で動作するアプリケーションの開発で利用される。"},
                   @{@"title":@"C++",
                     @"kana":@"シープラスプラス",
                     @"desc":@"C++（シープラスプラス）は、汎用プログラミング言語の一つである。日本では略してシープラプラ、シープラなどとも呼ばれる。\n1983年にベル研究所のコンピュータ科学者のビャーネ・ストロヴストルップが、C言語の拡張として開発した。当時の名前は「C with Classes」（クラス付きのC言語）だった。拡張はクラスの追加に始まり、仮想関数、多重定義、多重継承、テンプレート、例外処理といった機能が続いていった。1990年代以降、C++は、最もよく利用される商用のプログラミング言語の一つとなっている。\n標準規格化がISOとIEC共同で行われており、現在最新のバージョンは、2014年に制定されたISO/IEC 14882:2014、通称「C++14」である。\n表現力と効率性の向上のために、手続き型プログラミング・データ抽象・オブジェクト指向プログラミング・ジェネリックプログラミングの複数のプログラミングパラダイムを組み合わせている。アセンブリ言語以外の低水準言語を必要としない、使わない機能にコストを要しないことが、言語設計の重要な原則となっている。また、静的な型システムを持つ。\n言語仕様の拡張が繰り返され、複雑で難解な言語であると評価されている。エレガントで多種多様な記述方法が可能である点が混乱を招きやすい点は事実である。"},
                   @{@"title":@"HTML",
                     @"kana":@"エイチティーエムエル",
                     @"desc":@"HyperText Markup Language（ハイパーテキスト マークアップ ランゲージ）、略記・略称HTML（エイチティーエムエル）とは、ウェブ上の文書を記述するためのマークアップ言語である。文章の中に記述することでさまざまな機能を記述設定することができる。\nウェブの基幹的役割を持つ技術の一つでHTMLでマークアップされたドキュメントはほかのドキュメントへのハイパーリンクを設定できるハイパーテキストであり、画像・リスト・表などの高度な表現力を持つ。\n現在は、WHATWG により仕様が作られ、それを元に W3C により勧告が行われるという流れになっている。W3C は、XML ベースの規格である XHTML の勧告も行っている。"},
                   @{@"title":@"CSS",
                     @"kana":@"シーエスエス",
                     @"desc":@"Cascading Style Sheets（CSS、カスケーディング・スタイル・シート、カスケード・スタイル・シート）とは、HTML や XML の要素をどのように修飾（表示）するかを指示する、W3Cによる仕様の一つ。文書の構造と体裁を分離させるという理念を実現する為に提唱されたスタイルシートの、具体的な仕様の一つ。\nCSSはHTMLで表現可能と考えられるデザインの大部分を実現できる要素を取り入れつつ、新たなデザイン機能を備える。"},
                   @{@"title":@"Javascript",
                     @"kana":@"ジャヴァスクリプト",
                     @"desc":@"JavaScript（ジャヴァスクリプト）とは、プログラミング言語のひとつである。Javaと名前が似ているが、異なるプログラミング言語である（後述の#歴史を参照）。\nオブジェクト指向のスクリプト言語であることを特徴とする。\n実行環境が主にウェブブラウザに実装され、動的なウェブサイト構築や、リッチインターネットアプリケーションなど高度なユーザインタフェースの開発に用いられる。"},
                   @{@"title":@"MySQL",
                     @"kana":@"まい・えすきゅーえる",
                     @"desc":@"MySQL（まい・えすきゅーえる）は、オープンソースで公開されているRDBMSの実装の一つである。\nオープンソースで開発されており、GNU GPLと商用ライセンスのデュアルライセンスとなっている。\nもともと、他の多くのオープンソースプロジェクトと異なり、スウェーデンの単一の営利企業である「MySQL AB」によって維持されていた。 2008年2月26日に MySQL AB がサン・マイクロシステムズ（SUN）に買収されたことをもって、サン・マイクロシステムズの所有となった。 その後、2010年1月27日、サン・マイクロシステムズがオラクルに買収されたことにより、商標権ならびに著作権もオラクルに移管された。"},
                   @{@"title":@"Ruby",
                     @"kana":@"ルビー",
                     @"desc":@"Ruby（ルビー）は、まつもとゆきひろ（通称 Matz）により開発されたオブジェクト指向スクリプト言語であり、スクリプト言語が用いられてきた領域でのオブジェクト指向プログラミングを実現する。 また日本で開発されたプログラミング言語としては初めて国際電気標準会議で国際規格に認証された事例となった。"}
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
