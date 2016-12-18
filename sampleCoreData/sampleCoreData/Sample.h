//
//  Sample.h
//  sampleCoreData
//
//  Created by inagaki on 2015/09/16.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Sample : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * created;

@end
