//
//  ViewController.m
//  sampleCoreData
//
//  Created by inagaki on 2015/09/16.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Sample.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // AppDelegate で宣言されている CoreData 用の ManagedObjectContext を取得
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    self.managedObjectContext = context;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// データを新規追加する
- (IBAction)tapSaveButton:(id)sender {
    // 新規追加したいデータを作成
    NSString *title = self.inputTextField.text;
    NSDate *created = [NSDate new];
    
    // CoreData にデータを保存する
    Sample *sample = [NSEntityDescription insertNewObjectForEntityForName:@"Sample" inManagedObjectContext:self.managedObjectContext];
    
    [sample setTitle:title];
    [sample setCreated:created];
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        // エラー発生
        NSLog(@"%@", error);
    } else {
        NSLog(@"保存成功");
    }
}

// データを取得しログに表示
- (IBAction)tapSelectButton:(id)sender {
    // 検索条件を指定する変数
    NSDictionary *options = @{};
    
    NSArray *results = [self selectAllData:options];
    
    for (Sample *sample in results) {
        NSLog(@"title = %@", sample.title);
        NSLog(@"created = %@", sample.created);
    }
}

// データを更新
- (IBAction)tapUpdateButton:(id)sender {
    // 検索条件を指定する変数
    NSDictionary *options = @{};
    
    NSArray *results = [self selectAllData:options];
    
    for (Sample *sample in results) {
        NSDate *now = [NSDate new];
        
        sample.title = @"UpdateTest";
        sample.created = now;
    }
    
    // 書き換えたデータをそのまま CoreData に保存
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"%@", error);
    } else {
        NSLog(@"%@", @"編集成功");
    }
    
}

// すべてのデータを削除
- (IBAction)tapDeleteButton:(id)sender {
    // 検索条件を指定する変数
    NSDictionary *options = @{@"includesPropertyValues":@NO};
    
    NSArray *results = [self selectAllData:options];
    
    for (Sample *sample in results) {
        [sample.managedObjectContext deleteObject:sample];
    }
    
    // 削除したことを CoreData に保存
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"%@",error);
    } else {
        NSLog(@"%@", @"削除成功");
    }
}

// CoreData からデータを取得し配列にセット
- (NSArray *)selectAllData:(NSDictionary *)options {
    // fetch 設定を生成
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Sample"];
    
    // sort 順を設定
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"created" ascending:NO];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // managedObjectContext からデータを取得
    NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    return results;
}

@end
