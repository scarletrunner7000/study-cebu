//
//  Question.m
//  TestSolver
//
//  Created by inagaki on 2015/09/22.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "Question.h"

#define CHARS_FOR_COLOR_COUNT 1
#define CHARS_FOR_SIZE 2
#define COLORS_BEGIN_AT (CHARS_FOR_COLOR_COUNT + CHARS_FOR_SIZE * 2)
#define CHARS_FOR_COLOR 3

@interface Question ()


@end

@implementation Question {
    int cells_begin_at;
}

- (id)initWithHexcode:(NSString *)hexcode {
    NSArray *cols[SIZE];
    NSNumber *col[SIZE];
    UIColor *tmpColors[MAX_COLOR_AND_X];
    NSScanner *scan;
    unsigned int tmpUInt;
    int x, y;
    
    self = [super init];
    if (self == nil) {
        return nil;
    }
    
    NSLog(@"initWithHexcode:%@", hexcode);
    
    scan = [NSScanner scannerWithString:[hexcode substringWithRange:NSMakeRange(0, CHARS_FOR_COLOR_COUNT)]];
    [scan scanHexInt:&tmpUInt];
    _color_count = tmpUInt;
    if (_color_count != 2) {
        NSLog(@"指定された色数が不正です。=> color_count:%d", _color_count);
        return nil;
    }
    cells_begin_at = COLORS_BEGIN_AT + CHARS_FOR_COLOR * _color_count;
    
    scan = [NSScanner scannerWithString:[hexcode substringWithRange:NSMakeRange(CHARS_FOR_COLOR_COUNT, CHARS_FOR_SIZE)]];
    [scan scanHexInt:&tmpUInt];
    _width = tmpUInt;
    scan = [NSScanner scannerWithString:[hexcode substringWithRange:NSMakeRange(CHARS_FOR_COLOR_COUNT + CHARS_FOR_SIZE, CHARS_FOR_SIZE)]];
    [scan scanHexInt:&tmpUInt];
    _height = tmpUInt;
    if (_width > SIZE || _height > SIZE) {
        NSLog(@"指定されたサイズが不正です。=> width:%d, height:%d", _width, _height);
        return nil;
    }
    NSLog(@"color_count:%d, width:%d, height:%d", _color_count, _width, _height);
    if (hexcode.length < cells_begin_at + _width * _height) {
        NSLog(@"与えられたコードの文字数が不適切です。 => 実際の文字数:%ld, 期待の文字数:%d",
              hexcode.length, cells_begin_at + _width * _height);
        return nil;
    }
    
    for (int i = 0; i < _color_count; i++) {
        CGFloat r, g, b, a;
        
        scan = [NSScanner scannerWithString:[hexcode substringWithRange:NSMakeRange(COLORS_BEGIN_AT + CHARS_FOR_COLOR * i, CHARS_FOR_COLOR)]];
        [scan scanHexInt:&tmpUInt];
        tmpColors[i] = [UIColor colorWithRed:(tmpUInt >> 8) / 15.0
                                       green:((tmpUInt >> 4) % 16) / 15.0
                                        blue:(tmpUInt % 16) / 15.0
                                       alpha:1.0];
        [tmpColors[i] getRed:&r green:&g blue:&b alpha:&a];
        NSLog(@"colors[%d]: (%.2lf, %.2lf, %.2lf)", i, r, g, b);
    }
    tmpColors[_color_count] = [UIColor colorWithPatternImage:[UIImage imageNamed:@"x.png"]];
    _colors = [NSArray arrayWithObjects:tmpColors count:_color_count + 1];
    
    for (x = 0; x < _width; x++) {
        for (y = 0; y < _height; y++) {
            scan = [NSScanner scannerWithString:[hexcode substringWithRange:NSMakeRange(cells_begin_at + x + y * _width, 1)]];
            [scan scanHexInt:&tmpUInt];
            col[y] = [NSNumber numberWithInt:tmpUInt];
            if ([col[y] intValue] >= _color_count) {
                NSLog(@"与えられたコードが不適切です。 => %d文字目: %c",
                      cells_begin_at + _width * _height, [hexcode characterAtIndex:cells_begin_at + x + y * _width]);
                return nil;
            }
        }
        cols[x] = [NSArray arrayWithObjects:col count:_height];
    }
    _ans = [NSArray arrayWithObjects:cols count:_width];
    
    return self;
}

- (NSString *)toHexcode {
    char hexcode[COLORS_BEGIN_AT + CHARS_FOR_COLOR * MAX_COLOR_AND_X + SIZE * SIZE + 1];
    CGFloat r, g, b, a;
    int color_val;
    int x, y;
    
    sprintf(hexcode, "%1X", (int)_color_count);
    sprintf(hexcode + CHARS_FOR_COLOR_COUNT, "%02X", (int)_width);
    sprintf(hexcode + CHARS_FOR_COLOR_COUNT + CHARS_FOR_SIZE, "%02X", (int)_height);
    for (int i = 0; i < _color_count; i++) {
        [_colors[i] getRed:&r green:&g blue:&b alpha:&a];
        color_val = 0;
        color_val += ((int)(r * 15 + 0.5)) << 8;
        color_val += ((int)(g * 15 + 0.5)) << 4;
        color_val += ((int)(b * 15 + 0.5));
        sprintf(hexcode + COLORS_BEGIN_AT + CHARS_FOR_COLOR * i, "%03X", color_val);
    }
    
    for (y = 0; y < _height; y++) {
        for (x = 0; x < _width; x++) {
            sprintf(hexcode + cells_begin_at + x + y * _width, "%1X", [_ans[x][y] intValue]);
        }
    }
    
    return [NSString stringWithCString:hexcode encoding:NSASCIIStringEncoding];
}

- (NSString *)toString {
    char str[(SIZE + 1) * SIZE + 1];
    int x, y;
    
    for (y = 0; y < _height; y++) {
        for (x = 0; x < _width; x++) {
            sprintf(str + x + y * (_width + 1), "%1X", [_ans[x][y] intValue]);
        }
        str[_width + y * (_width + 1)] = '\n';
    }
    str[(_width + 1) * _height] = '\0';
    return [NSString stringWithCString:str encoding:NSASCIIStringEncoding];
}

@end
