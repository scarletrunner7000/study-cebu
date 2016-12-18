//
//  Friend.h
//  SampleCoreDataFriends
//
//  Created by Eriko Ichinohe on 2015/04/27.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Friend : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * area_id;
@property (nonatomic, retain) NSDate * created;

@end
