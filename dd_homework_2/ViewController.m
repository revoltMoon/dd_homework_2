//
//  ViewController.m
//  dd_homework_2
//
//  Created by Влад Купряков on 12.10.17.
//  Copyright © 2017 Влад Купряков. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
@import UIKit;
@interface ViewController ()
@end

@implementation ViewController

NSMutableArray* ar;

- (void)viewDidLoad {
    [super viewDidLoad];
    ar = [[NSMutableArray alloc]init];
}

-(void)addColor:(UIColor *)color
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithAttributedString:_textField.attributedText];
    [str addAttribute:NSForegroundColorAttributeName value:color range:[self.textField selectedRange]];
    
 //добавление выделенной нами строки в массив строк
    [self addStringToArr:color];
 //чтобы не прокручивалось в конец UITextView при изменении цвета
    _textField.scrollEnabled = NO;
    NSRange range = _textField.selectedRange;
    _textField.attributedText = str;
    _textField.selectedRange = range;
    _textField.scrollEnabled = YES;
}


-(void)addStringToArr:(UIColor *)color
{
    //ищем позицию выделенной нами части текста, чтобы потом вынести его в отдельную строку, затем создаем изменяемую строку с атрибутами, добавляем нужный нам цвет текста и закидываем в массив
    UITextRange *selectedRange = [_textField selectedTextRange];
    NSString *selectedText = [_textField textInRange:selectedRange];
    NSMutableAttributedString *str2 = [[NSMutableAttributedString alloc] initWithString:selectedText];
    [str2 addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, selectedText.length)];
    [ar addObject:str2];
}

-(NSMutableArray *)returnArr
{
    return ar;
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
