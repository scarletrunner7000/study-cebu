//
//  FriendsViewController.m
//  SampleCoreDataFriends
//
//  Created by Eriko Ichinohe on 2015/04/24.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import "FriendsViewController.h"

@interface FriendsViewController (){
    NSMutableArray *_friendArray;
}

@end

@implementation FriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //ナビゲーションコント−ローラの右にEditボタンを配置
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //ナビゲーションコントローラーにエリア名を指定
    self.navigationItem.title = self.areaString;
    
    self.navigationController.delegate = self;
    
    
    //指定されたエリアの友達を取得
    //_Array = @[@"a",@"b",@"c",@"d"];
    [self getFriendsInAreaSelected];
}

//指定されたエリアの友達を取得
-(void)getFriendsInAreaSelected{
    NSDictionary *options = @{@"area_id":[NSString stringWithFormat:@"%d",self.areaNum]};
    
    _friendArray = [NSMutableArray new];
    _friendArray = [[self selectAllData:options] mutableCopy];
    

}

- (NSArray *)selectAllData:(NSDictionary *)options {
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];

    //fetch設定を生成
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Friend"];
    
    // optionの指定があった場合には、指定されたオプションを設定する
    if (options) {
        if ([[options valueForKey:@"includesPropertyValues"] isEqualToNumber:[NSNumber numberWithBool:NO]]) {
            [fetchRequest setIncludesPropertyValues:NO];
        }else{
            NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"area_id = %@",[options objectForKey:@"area_id"]]];
            [fetchRequest setPredicate:predicate];
        }
    }
    
    //sort条件を設定
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"created" ascending:NO];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // managedObjectContextからデータを取得
    NSArray *results = [context executeFetchRequest:fetchRequest error:nil];
    
    return results;
}

//行数を返す
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _friendArray.count;
}

//セルオブジェクトの作成（文字表示）
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //定数を宣言（static = 静的)
    static NSString *CellIdentifer = @"Cell";
    
    //セルの再利用
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    
    if(cell == nil){
        //セルの初期化とスタイルの決定
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
    }
    
    Friend *friend = _friendArray[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",friend.name];
    return cell;
}


//Editボタンが押された時
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.friendsTable setEditing:editing animated:YES];
    if (editing) { // 現在編集モードです。
    } else { // 現在通常モードです。
    }
}

//Deleteボタンが押された時
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //CoreDataから削除
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *context = [appDelegate managedObjectContext];
        
        Friend *friend = _friendArray[indexPath.row];
        [context deleteObject:friend];
        
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"%@", error);
        } else {
            NSLog(@"削除完了");
        }

        //表示側も配列からデータを削除することでCoreDataの状態を反映
        [_friendArray removeObjectAtIndex:indexPath.row]; // 削除ボタンが押された行のデータを配列から削除します。
        
        //テーブルビューからも消します
        [self.friendsTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // ここは空のままでOKです。
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//＋（追加）ボタンが押された時
- (IBAction)tapBtnAdd:(id)sender {
    //友達の追加
    // AppDelegateで宣言されているCoreData用のManagedObjectContextを取得
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    // インサートしたいデータを作成
    NSString *name = self.friendNameText.text;
    NSDate *created = [NSDate new];
    NSNumber *area_id = [NSNumber numberWithInt:self.areaNum];
    
    // CoreDataにデータを保存する
    Friend *friend = [NSEntityDescription insertNewObjectForEntityForName:@"Friend" inManagedObjectContext:context];
    
    [friend setName:name];
    [friend setCreated:created];
    [friend setArea_id:area_id];
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"%@", error);
    } else {
        NSLog(@"保存成功");
        
        //配列を更新
        [self getFriendsInAreaSelected];

        // テーブルビューを更新
        [self.friendsTable reloadData];
    }
    
    

}
@end
