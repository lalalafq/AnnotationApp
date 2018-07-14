//
//  XMCalculate.h
//  XMAnnotationDemo
//
//  Created by fuqi on 2018/5/18.
//  Copyright © 2018年 fuqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMVector.h"
#import "XMMatrix.h"

@interface XMCalculate : NSObject

/// 矩阵乘以矩阵：相当于操作矩阵1 * 操作矩阵2
+ (XMMatrix *)multiplyMaxtrix:(XMMatrix *)m withMaxtrix:(XMMatrix *)m;

/// 向量乘以矩阵：相当于原始坐标点 * 操作矩阵
+ (XMVector *)multiplyVector:(XMVector *)v withMaxtrix:(XMMatrix *)m;

/// 求逆矩阵；
+ (XMMatrix *)invertMatrix:(XMMatrix *)a;

@end
