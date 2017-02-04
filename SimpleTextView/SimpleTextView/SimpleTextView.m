//
//  SimpleTextView.m
//  TableViewDemo
//
//  Created by Mr.Gu on 17/2/4.
//  Copyright © 2017年 Mr.Gu. All rights reserved.
//

#import "SimpleTextView.h"

#define defaultFont  14

@interface SimpleTextView ()<UITextViewDelegate>

@end

@implementation SimpleTextView
{
    UILabel *_placeholderLabel;         /// 占位文字框
    UITextView *_textView;              /// 输入框
    UILabel *_countLabel;               /// 字数统计框
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self configSubViews];
    }
    return self;
}

- (void)configSubViews
{
    _textView = [[UITextView alloc] init];
    _textView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
    _textView.font = [UIFont systemFontOfSize:defaultFont];
    _textView.delegate = self;
    
    _placeholderLabel = [[UILabel alloc] init];
    _placeholderLabel.textColor = [UIColor lightGrayColor];
    _placeholderLabel.font = [UIFont systemFontOfSize:defaultFont];
    _placeholderLabel.hidden = YES;
    
    _countLabel = [[UILabel alloc] init];
    _countLabel.textColor = [UIColor lightGrayColor];
    _countLabel.font = [UIFont systemFontOfSize:10];
    _countLabel.text = @"0个字";
    [_countLabel sizeToFit];
    
    [self addSubview:_textView];
    [self addSubview:_placeholderLabel];
    [self addSubview:_countLabel];
}

- (void)layoutSubviews
{
    _textView.frame = self.bounds;
    
    _placeholderLabel.frame = CGRectMake(5, 8, _placeholderLabel.bounds.size.width, _placeholderLabel.bounds.size.height);
    
    _countLabel.frame = CGRectMake(self.bounds.size.width - _countLabel.bounds.size.width - 5, self.bounds.size.height - _countLabel.bounds.size.height - 5, _countLabel.bounds.size.width, _countLabel.bounds.size.height);
}

#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length > _maxInputCount && _maxInputCount) {
        textView.text = [textView.text substringToIndex:_maxInputCount];
    }
    
    if (_maxInputCount) {
        _countLabel.text = textView.text.length ? [NSString stringWithFormat:@"%lu个字",(unsigned long)textView.text.length] : [NSString stringWithFormat:@"最多输入%ld个字", _maxInputCount];
    }else {
        _countLabel.text = [NSString stringWithFormat:@"%lu个字",(unsigned long)textView.text.length];
    }
    [_countLabel sizeToFit];
    
    _placeholderLabel.hidden = textView.text.length ? YES : NO;
    
    if ([self.delegate respondsToSelector:@selector(simpleTextViewDidChangeText:)]) {
        [self.delegate simpleTextViewDidChangeText:textView.text];
    }
}


#pragma mark - setter
- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    
    if (!placeholder.length) {
        _placeholderLabel.hidden = YES;
    }else {
        _placeholderLabel.hidden = NO;
        _placeholderLabel.text = placeholder;
        [_placeholderLabel sizeToFit];
    }
}

- (void)setText:(NSString *)text
{
    _placeholderLabel.hidden = text.length ? YES : NO;
    
    _textView.text = text;
    _countLabel.text = [NSString stringWithFormat:@"%lu个字", (unsigned long)(text.length ? text.length : 0)];
    [_countLabel sizeToFit];
}

- (void)setMaxInputCount:(NSInteger)maxInputCount
{
    _maxInputCount = maxInputCount;
    _countLabel.text = [NSString stringWithFormat:@"最多输入%ld个字", maxInputCount];
    [_countLabel sizeToFit];
}

- (void)setTextColor:(UIColor *)textColor
{
    _textView.textColor = textColor;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    _textView.backgroundColor = backgroundColor;
}

#pragma mark - getter

- (NSString *)text
{
    return _textView.text;
}

@end
