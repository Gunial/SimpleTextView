//
//  ViewController.m
//  SimpleTextView
//
//  Created by Mr.Gu on 17/2/4.
//  Copyright © 2017年 Mr.Gu. All rights reserved.
//

#import "ViewController.h"
#import "SimpleTextView.h"

@interface ViewController ()<SimpleTextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    SimpleTextView *textView = [[SimpleTextView alloc] init];
    textView.frame = CGRectMake(20, 100, self.view.bounds.size.width - 40, 200);
    
    textView.placeholder = @"我就是一串占位文字";
    textView.maxInputCount = 20;
    textView.text = @"我是一段内容";
    textView.textColor = [UIColor redColor];
    textView.backgroundColor = [UIColor yellowColor];
    textView.delegate = self;
    
    [self.view addSubview:textView];
}

- (void)simpleTextViewDidChangeText:(NSString *)text
{
    NSLog(@"%@", text);
}


@end
