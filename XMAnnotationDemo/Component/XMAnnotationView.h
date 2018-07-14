//
//  XMAnnotationView.h
//  XMAnnotationDemo
//
//  Created by fuqi on 2018/5/17.
//  Copyright © 2018年 fuqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMAnnotationView.h"

typedef enum : NSUInteger {
    AnnotationTypeDraw,
    AnnotationTypeMove,
    AnnotationTypeScale,
    AnnotationTypeErasure
} AnnotationType;

@interface XMAnnotationView : UIView


@property (nonatomic,strong)UIImage * image;

@property (nonatomic)AnnotationType annotationType;

@property (nonatomic)CGFloat annotationMinWidth;
@property (nonatomic)CGFloat annotationMinHeight;

/// 去除所有
- (void)cleanAllRect;
/// 顺时针旋转
- (void)clockwiseRatation;
/// 逆时针旋转
- (void)antiClockwiseRatation;
/// 隐藏所有
- (void)hiddenAllRect;
/// 撤销
- (void)undo;

- (void)handleUp;
- (void)handleDown;
- (void)handleLeft;
- (void)handleRight;
- (void)handleBlank;

@end
