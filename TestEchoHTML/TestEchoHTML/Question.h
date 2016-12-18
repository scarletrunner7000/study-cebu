//
//  Question.h
//  TestEchoHTML
//
//  Created by inagaki on 2015/09/18.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#define SIZE 100

@interface Question : NSObject

@property (readonly) int width;
@property (readonly) int height;
@property (readonly, copy) NSArray *cells;

- (id)initWithHexcode:(NSString *)hexcode;
- (NSString *)toHTML;
- (NSString *)toHexcode;
- (NSString *)toString;

@end
