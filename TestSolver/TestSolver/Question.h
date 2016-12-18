//
//  Question.h
//  TestSolver
//
//  Created by inagaki on 2015/09/22.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SIZE 100
#define MAX_COLOR_AND_X 16

@interface Question : NSObject

@property (readonly) int color_count;
@property (readonly) int width;
@property (readonly) int height;
@property (readonly, copy) NSArray *colors;
@property (readonly, copy) NSArray *ans;

- (id)initWithHexcode:(NSString *)hexcode;
- (NSString *)toHexcode;
- (NSString *)toString;

@end
