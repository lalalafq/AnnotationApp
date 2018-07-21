//
//  XMMatrix.h
//  XMAnnotationDemo
//
//  Created by fuqi on 2018/5/18.
//  Copyright © 2018年 fuqi. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XMMatrix : NSObject

@property (nonatomic,strong,readonly)NSArray<NSNumber *> * matrixArray;

/// 单位矩阵
+ (XMMatrix *)identityMatrix;
// 平移矩阵
+ (XMMatrix *)translateMatrixWithX:(int)dx withY:(int)dy;
// 旋转矩阵
+ (XMMatrix *)rotateMatrix:(double)delta;
// 以某个点做旋转 = 以原点旋转 + 转点的坐标
+ (XMMatrix *)rotateMatrix:(double)delta originPoint:(CGPoint)originPoint;
// 缩放矩阵
+ (XMMatrix *)scaleMatrixWithX:(double)sx withY:(double)sy;

- (instancetype)initWithArray:(NSArray <NSNumber *> *)array;

- (instancetype)initWithValue1:(int)m00
                    withValue2:(int)m01
                    withValue3:(int)m02
                    withValue4:(int)m10
                    withValue5:(int)m11
                    withValue6:(int)m12
                    withValue7:(int)m20
                    withValue8:(int)m21
                    withValue9:(int)m22;



@end
