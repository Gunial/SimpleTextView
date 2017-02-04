//
//  SimpleTextView.h
//  TableViewDemo
//
//  Created by Mr.Gu on 17/2/4.
//  Copyright © 2017年 Mr.Gu. All rights reserved.
//


/** 
 *  如果textView的光标的初始位置中间位置
 *  在控制器中添加      self.automaticallyAdjustsScrollViewInsets = NO;
 */

#import <UIKit/UIKit.h>

@protocol SimpleTextViewDelegate <NSObject>

- (void)simpleTextViewDidChangeText:(NSString *)text; /// 把textView中的内容传递出去

@end


@interface SimpleTextView : UIView

/** 属性 */
@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSString *placeholder;

@property (nonatomic, assign) NSInteger maxInputCount;

@property (nonatomic, strong) UIColor *textColor;

@property (nonatomic, strong) UIColor *backgroundColor;

@property (nonatomic, weak) id<SimpleTextViewDelegate> delegate;

@end
