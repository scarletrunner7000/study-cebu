//
//  ViewController.h
//  Sample004
//
//  Created by Shinya Hirai on 2015/07/10.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
- (IBAction)inputText:(id)sender;

- (IBAction)tapBtn:(id)sender;
- (IBAction)chageSlider:(id)sender;

@end

