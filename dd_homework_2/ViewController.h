//
//  ViewController.h
//  dd_homework_2
//
//  Created by Влад Купряков on 12.10.17.
//  Copyright © 2017 Влад Купряков. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textField;
- (IBAction)Blue:(UIButton *)sender;
- (IBAction)Green:(UIButton *)sender;
- (IBAction)Orange:(UIButton *)sender;
- (IBAction)Red:(UIButton *)sender;
- (IBAction)Clear:(UIButton *)sender;
@end

