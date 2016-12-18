//
//  ViewController.m
//  901_sampleCoreData
//
//  Created by NishideDaisuke on 2014/12/17.
//  Copyright (c) 2014年 knife0125. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Sample.h"

@interface ViewController ()

@property (strong, nonatomic) NSManagedObjectContext *context;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // AppDelegateで宣言されているCoreData用のManagedObjectContextを取得
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    self.context = context;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveData:(id)sender {
    // インサートしたいデータを作成
    NSString *title = self.titleField.text;
    NSDate *created = [NSDate new];

    // CoreDataにデータを保存する
    Sample *sample = [NSEntityDescription insertNewObjectForEntityForName:@"Sample" inManagedObjectContext:self.context];
    
    [sample setTitle:title];
    [sample setCreated:created];

    NSError *error;
    if (![self.context save:&error]) {
        NSLog(@"%@", error);
    } else {
        NSLog(@"保存成功");
    }
}

- (IBAction)updateData:(id)sender {
    NSDictionary *options = @{};

    // CoreDataからデータを取得する
    NSArray *results = [self selectAllData:options];

    // 取得したCoreData Objectのプロパティを書き換える（アップデート的な変更処理）
    for (Sample *sample in results) {
        NSDate *now = [NSDate new];
        
        sample.title = @"test";
        sample.created = now;
    }
    
    // 書き換えたデータをそのままCoreDataに保存
    NSError *error;
    if (![self.context save:&error]) {
        NSLog(@"%@", error);
    } else {
        NSLog(@"編集成功");
    }
}

- (IBAction)selectData:(id)sender {
    NSDictionary *options = @{};
    
    NSArray *results = [self selectAllData:options];

    for (Sample *sample in results) {
        NSLog(@"%@", sample.title);
        NSLog(@"%@", sample.created);
    }
}

- (IBAction)deleteData:(id)sender {
    NSDictionary *options = @{@"includesPropertyValues": @NO};

    // すべてのデータを取得
    NSArray *results = [self selectAllData:options];

    // すべてのデータを削除する
    for (Sample *sample in results) {
        [self.context deleteObject:sample];
    }
//    // 一番古いやつを削除
//    Sample *oldSample = [results lastObject];
//    [self.context deleteObject:oldSample];
//    
//    // 一番新しいやつを削除
//    Sample *newSample = [results firstObject];
//    [self.context deleteObject:newSample];
    
    // 削除したことをCoreDataに保存
    NSError *error = nil;
    if (![self.context save:&error]) {
        NSLog(@"%@", error);
    } else {
        NSLog(@"削除完了");
    }
}

- (NSArray *)selectAllData:(NSDictionary *)options {
    //fetch設定を生成
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Sample"];

    // optionの指定があった場合には、指定されたオプションを設定する
    if (options) {
        if ([[options valueForKey:@"includesPropertyValues"] isEqualToNumber:[NSNumber numberWithBool:NO]]) {
            [fetchRequest setIncludesPropertyValues:NO];
        }
    }
    
    //sort条件を設定
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"created" ascending:NO];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // managedObjectContextからデータを取得
    NSArray *results = [self.context executeFetchRequest:fetchRequest error:nil];

    return results;
}

@end
