//
//  NSString+RectSize.h
//  XMAnnotationDemo
//
//  Created by fuqi on 2018/7/14.
//  Copyright © 2018年 fuqi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RectSize)

/// 获取指定字体、最大宽度下的最佳size（普通文本）
- (CGSize)labelSizeWithWidth:(int)width font:(UIFont *)font;

@end
