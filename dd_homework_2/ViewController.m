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
NSMutableArray *ar;
NSMutableArray<NSValue*>* arForRange;
NSAttributedString* stringg;

- (void)viewDidLoad {
    [super viewDidLoad];
    ar = [[NSMutableArray alloc]init];
    arForRange = [[NSMutableArray alloc]init];
    stringg = [[NSAttributedString alloc]init];
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
    //чтобы использовать строку для изменения текста в UITextView при возможном удалении элементов
    stringg = _textField.attributedText;
}


-(void)addStringToArr:(UIColor *)color
{
    //ищем позицию выделенной нами части текста
    UITextRange *selectedRange = [_textField selectedTextRange];
    NSString *selectedText = [_textField textInRange:selectedRange];
    
    //закидываем range нашей строчки, чтобы потом при удалении его использовать
    [arForRange addObject:[NSValue valueWithRange:self.textField.selectedRange]];
    
    //выносим выделенную часть текста в отдельную строку, затем создаем изменяемую строку с атрибутами, добавляем нужный нам цвет текста и закидываем в массив
    NSMutableAttributedString *str2 = [[NSMutableAttributedString alloc] initWithString:selectedText];
    [str2 addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, selectedText.length)];
    if (str2.length > 0)
    {
    [ar addObject:str2];
    }
}

-(NSMutableArray *)returnArr
{
    return ar;
}


-(void)takeIdx:(NSInteger *)idx
{
    //удаляем из массива строчку, которую удалили в UITableView
    [ar removeObjectAtIndex:(int)idx];
    //создаем строку, чтобы закрасить черным цветом то место, где была удаленная нами строка
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithAttributedString:stringg];
    NSRange Range = arForRange[(int)idx].rangeValue;
    [str addAttribute:NSForegroundColorAttributeName value:UIColor.blackColor range:Range];
    stringg = str;
    [arForRange removeObjectAtIndex:(int)idx];
}
-(void)viewWillAppear:(BOOL)animated{
    //перед показом UIViewControllera меняем наш текст в UITextView
    if (stringg.length > 0)
        {
            _textField.attributedText = stringg;
        }
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
