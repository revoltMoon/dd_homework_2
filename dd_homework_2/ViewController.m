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

- (NSRange) selectText:(UITextView*)field
{
    UITextPosition* beginOfFile = field.beginningOfDocument;
    UITextRange* selectedRange = field.selectedTextRange;
    UITextPosition* start = selectedRange.start;
    UITextPosition* end = selectedRange.end;
    const NSInteger location = [field offsetFromPosition:beginOfFile toPosition:start];
    const NSInteger length = [field offsetFromPosition:start toPosition:end];
    return NSMakeRange(location, length);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Blue:(UIButton *)sender {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]init];
    str = _textField.attributedText.mutableCopy;
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:[self selectText:_textField]];
    _textField.attributedText = str.copy;
}

- (IBAction)Green:(UIButton *)sender {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]init];
    str = _textField.attributedText.mutableCopy;
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:[self selectText:_textField]];
    _textField.attributedText = str.copy;
}

- (IBAction)Orange:(UIButton *)sender {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]init];
    str = _textField.attributedText.mutableCopy;
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:[self selectText:_textField]];
    _textField.attributedText = str.copy;
    
}

- (IBAction)Red:(UIButton *)sender {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]init];
    str = _textField.attributedText.mutableCopy;
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:[self selectText:_textField]];
    _textField.attributedText = str.copy;
}

- (IBAction)Clear:(UIButton *)sender {
    _textField.textColor = UIColor.blackColor;
}
@end
