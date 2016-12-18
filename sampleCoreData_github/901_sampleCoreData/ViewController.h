//
//  ViewController.h
//  901_sampleCoreData
//
//  Created by NishideDaisuke on 2014/12/17.
//  Copyright (c) 2014年 knife0125. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ViewController : UIViewController<NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) IBOutlet UITextField *titleField;

- (IBAction)saveData:(id)sender;
- (IBAction)updateData:(id)sender;
- (IBAction)selectData:(id)sender;
- (IBAction)deleteData:(id)sender;

@end

