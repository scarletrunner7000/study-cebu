//
//  ViewController.m
//  TestSolver
//
//  Created by inagaki on 2015/09/22.
//  Copyright (c) 2015年 inagaki. All rights reserved.
//

#import "ViewController.h"
#import "Question.h"

#define TAG_OFFSET (SIZE * SIZE + 1)

@interface ViewController ()

@end

@implementation ViewController {
    NSMutableArray *cells;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *testHexcodes = @[
                              @"20506FFF000101010011010101010110100101011"
                              ];
    _q = [[Question alloc] initWithHexcode:testHexcodes[0]];
    NSLog(@"%@", [_q toHexcode]);
    NSLog(@"\n%@", [_q toString]);
    
    int x, y;
    int dw, dh;
    
    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(100, 125, 20 * _q.width, 20 * _q.height)];
    bg.backgroundColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1];
    [self.view addSubview:bg];
    
    for (y = 0; y < _q.height; y++) {
        for (x = 0; x < _q.width; x++) {
            if (x % 5 == 0) {
                dw = 1;
            } else {
                dw = 0;
            }
            if (y % 5 == 0) {
                dh = 1;
            } else {
                dh = 0;
            }
            UIView *cell = [[UIView alloc] initWithFrame:CGRectMake(100 + x * 20 + dw, 125 + y * 20 + dh, 19 - dw, 19 - dh)];
            cell.backgroundColor = _q.colors[0];
            cell.tag = x + y * _q.width - TAG_OFFSET ;
            [self.view addSubview:cell];
        }
    }
    cells = [NSMutableArray arrayWithCapacity:_q.width];
    for (x = 0; x < _q.width; x++) {
        NSMutableArray *tmpCells = [NSMutableArray arrayWithCapacity:_q.height];
        for (y = 0; y < _q.height; y++) {
            [tmpCells addObject:[NSNumber numberWithInt:0]];
        }
        [cells addObject:tmpCells];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    int x, y;
    
    if (touch.view.tag >= 0) {
        return;
    }
    
    x = (int)(touch.view.tag + TAG_OFFSET) % _q.width;
    y = (int)(touch.view.tag + TAG_OFFSET) / _q.width;
    NSLog(@"(%d, %d)", x, y);
    cells[x][y] = [NSNumber numberWithInt:([cells[x][y] intValue] + 1) % (_q.color_count + 1)];
    touch.view.backgroundColor = _q.colors[[cells[x][y] intValue]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
