//
//  Question.m
//  TestEchoHTML
//
//  Created by inagaki on 2015/09/18.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

#define CHARS_FOR_SIZE 2
#define CHARS_ONCE_EACH (sizeof(unsigned int) * 2)
#define UINT_BITS (sizeof(unsigned int) * 8)
#define CHAR_FOR_BLACK_CELL '@'

@interface Question ()

- (int)binariesIndexWithX:(int)x withY:(int)y;
- (int)binariesPlaceWithX:(int)x withY:(int)y;

@end

@implementation Question

- (id)initWithHexcode:(NSString *)hexcode {
    NSArray *cols[SIZE];
    NSNumber *col[SIZE];
    unsigned int binaries[(SIZE * SIZE + UINT_BITS - 1) / UINT_BITS];
    NSScanner *scan;
    unsigned int tmpUInt;
    NSRange range;
    int x, y;
    int i, j;
    
    self = [super init];
    if (self == nil) {
        return nil;
    }
    
    NSLog(@"initWithHexcode:%@", hexcode);
    
    scan = [NSScanner scannerWithString:[hexcode substringWithRange:NSMakeRange(0, CHARS_FOR_SIZE)]];
    [scan scanHexInt:&tmpUInt];
    _width = tmpUInt;
    scan = [NSScanner scannerWithString:[hexcode substringWithRange:NSMakeRange(CHARS_FOR_SIZE, CHARS_FOR_SIZE)]];
    [scan scanHexInt:&tmpUInt];
    _height = tmpUInt;
    if (_width > SIZE || _height > SIZE) {
        NSLog(@"指定されたサイズが不正です。=> width:%d, height:%d", _width, _height);
        return nil;
    }
    NSLog(@"width:%d, height:%d", _width, _height);
    
    // +3 しているのは割り算で切り上げするため
    if (hexcode.length != CHARS_FOR_SIZE * 2 + (_width * _height + 3) / 4) {
        NSLog(@"与えられたコードの文字数が不適切です。 => 実際の文字数:%ld, 期待の文字数:%d",
              hexcode.length, CHARS_FOR_SIZE * 2 + (_width * _height + 3) / 4);
        return nil;
    }
    
    for (i = 0; CHARS_FOR_SIZE * 2 + i * CHARS_ONCE_EACH < hexcode.length; i++) {
        range = NSMakeRange(CHARS_FOR_SIZE * 2 + i * CHARS_ONCE_EACH,
                            MIN(CHARS_ONCE_EACH, hexcode.length - (CHARS_FOR_SIZE * 2 + i * CHARS_ONCE_EACH)));
        scan = [NSScanner scannerWithString:[hexcode substringWithRange:range]];
        [scan scanHexInt:&binaries[i]];
        // 残りの文字数が CHARS_ONCE_EACH より少なかった時は、足りないビットの分をシフトする。
        if (CHARS_FOR_SIZE * 2 + i * CHARS_ONCE_EACH + CHARS_ONCE_EACH > hexcode.length) {
            binaries[i] <<= (CHARS_FOR_SIZE * 2 + i * CHARS_ONCE_EACH + CHARS_ONCE_EACH - hexcode.length) * 4;
        }
    }
    
    for (x = 0; x < _width; x++) {
        for (y = 0; y < _height; y++) {
            i = [self binariesIndexWithX:x withY:y];
            j = [self binariesPlaceWithX:x withY:y];
            col[y] = [NSNumber numberWithBool:(binaries[i] & 1 << (UINT_BITS - j - 1))];
        }
        cols[x] = [NSArray arrayWithObjects:col count:_height];
    }
    _cells = [NSArray arrayWithObjects:cols count:_width];
    
    return self;
}

- (NSString *)toHTML {
    NSMutableString *html = @"".mutableCopy;
    int x, y;
    
    [html appendString:
     @"<!DOCTYPE html>\n"
     "<html>\n"
     "<head>\n"
     "<title>test</title>\n"
     "<link rel=\"stylesheet\" type=\"text/css\" href=\"testEchoHTML.css\">\n"
     "<script src=\"jquery-1.11.3.min.js\" type=\"text/javascript\"></script>\n"
     "<script src=\"testEchoHTML.js\" type=\"text/javascript\"></script>\n"
     "</head>\n"
     "<body>\n"];
    [html appendString:
     @"<table class=\"cells\">\n"
     "  <tbody>\n"];
    
    for (y = 0; y < _height; y++) {
        [html appendString:
         @"    <tr>\n"];
        for (x = 0; x < _width; x++) {
            [html appendFormat:
             @"      <td>\n"
             "        <div class=\"%@%@%@\"></div>\n"
             "      </td>\n",
             [_cells[x][y] boolValue] ? @"black" : @"white",
             x % 5 == 4 ? @" x-5" : @"",
             y % 5 == 4 ? @" y-5" : @""];
        }
        [html appendString:
         @"    </tr>\n"];
    }
    
    [html appendString:
     @"  </tbody>\n"
     "</table>\n"];
    [html appendString:
     @"</body>\n"
     "</html>\n"];
    
    return html;
}

- (NSString *)toHexcode {
    char hexcode[CHARS_FOR_SIZE * 2 + (SIZE * SIZE + 3) / 4 + 1];
    unsigned int binary;
    int x, y;
    
    sprintf(hexcode, "%02X", (int)_width);
    sprintf(hexcode + CHARS_FOR_SIZE, "%02X", (int)_height);
    for (int at = 0; at * 4 < _width * _height; at++) {
        binary = 0;
        for (int i = 0; i < 4 && at * 4 + i < _width * _height; i++) {
            x = (at * 4 + i) % _width;
            y = (at * 4 + i) / _width;
            binary += [_cells[x][y] boolValue] ? (1 << (4 - i - 1)) : 0;
        }
        sprintf(hexcode + CHARS_FOR_SIZE * 2 + at, "%X", binary);
    }
    
    return [NSString stringWithCString:hexcode encoding:NSASCIIStringEncoding];
}

- (NSString *)toString {
    char str[(SIZE + 1) * SIZE + 1];
    int x, y;
    
    for (y = 0; y < _height; y++) {
        for (x = 0; x < _width; x++) {
            str[x + y * (_width + 1)] = [_cells[x][y] boolValue] ? CHAR_FOR_BLACK_CELL : ' ';
        }
        str[_width + y * (_width + 1)] = '\n';
    }
    str[(_width + 1) * _height] = '\0';
    return [NSString stringWithCString:str encoding:NSASCIIStringEncoding];
}

- (int)binariesIndexWithX:(int)x withY:(int)y {
    return (int)((x + y * _width) / UINT_BITS);
}

- (int)binariesPlaceWithX:(int)x withY:(int)y {
    return (int)((x + y * _width) % UINT_BITS);
}

@end
