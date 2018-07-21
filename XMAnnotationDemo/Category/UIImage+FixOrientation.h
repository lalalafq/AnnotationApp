//
//  UIImage+FixOrientation.h
//  XMAnnotationDemo
//
//  Created by fuqi on 2018/7/21.
//  Copyright © 2018年 fuqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FixOrientation)

/** 纠正图片的方向 */
- (UIImage *)fixOrientation;

/** 按给定的方向旋转图片 */
- (UIImage*)rotate:(UIImageOrientation)orient;

/** 垂直翻转 */
- (UIImage *)flipVertical;

/** 水平翻转 */
- (UIImage *)flipHorizontal;

/** 将图片旋转degrees角度 */
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

/** 将图片旋转radians弧度 */
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;

@end
