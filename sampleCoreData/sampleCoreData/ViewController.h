//
//  ViewController.h
//  sampleCoreData
//
//  Created by inagaki on 2015/09/16.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ViewController : UIViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *selectButton;
@property (weak, nonatomic) IBOutlet UIButton *updateButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

- (IBAction)tapSaveButton:(id)sender;
- (IBAction)tapSelectButton:(id)sender;
- (IBAction)tapUpdateButton:(id)sender;
- (IBAction)tapDeleteButton:(id)sender;

@end

