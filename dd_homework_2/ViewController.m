//
//  ViewController.m
//  dd_homework_2
//
//  Created by Влад Купряков on 12.10.17.
//  Copyright © 2017 Влад Купряков. All rights reserved.
//

#import "ViewController.h"
@import UIKit;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)addColor:(UIColor *)color
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithAttributedString:_textField.attributedText];
    [str addAttribute:NSForegroundColorAttributeName value:color range:[self.textField selectedRange]];
    _textField.attributedText = str;
}


- (IBAction)secondVC:(UIButton *)sender {
}


- (IBAction)Blue:(UIButton *)sender {
    [self addColor: UIColor.blueColor];
}

- (IBAction)Green:(UIButton *)sender {
    [self addColor: UIColor.greenColor];
}

- (IBAction)Orange:(UIButton *)sender {
    [self addColor: UIColor.orangeColor];
}

- (IBAction)Red:(UIButton *)sender {
    [self addColor: UIColor.redColor];
}

- (IBAction)Clear:(UIButton *)sender {
    [self addColor: UIColor.blackColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
