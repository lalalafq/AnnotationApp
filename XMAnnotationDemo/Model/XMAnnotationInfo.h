//
//  XMAnnotationInfo.h
//  XMAnnotationDemo
//
//  Created by fuqi on 2018/5/17.
//  Copyright © 2018年 fuqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMMatrix.h"
#import "XMVector.h"

@interface XMAnnotationInfo : NSObject

// 原始点向量坐标
@property (nonatomic,strong)NSMutableArray <XMVector *> * originPoints;

/// 所有画框的父画框为背景图片。背景图片的父画框为nil
@property (nonatomic,strong)XMAnnotationInfo * parentAnnInfo;

//// 真是点向量坐标
//@property (nonatomic,strong)NSMutableArray <XMVector *> * realPoints;

// 当时画布的变换矩阵
@property (nonatomic,strong)XMMatrix * thenMatrix;
/// 后续的操作矩阵
@property (nonatomic,strong)NSMutableArray <XMMatrix *> * operationMatrix;
/// 矩阵积
@property (nonatomic,strong)XMMatrix * currentMatrix;

/// 获取转换后的坐标。（在视图中的实际位置）
- (NSMutableArray<XMVector *> *)translatePointByOperation;

/// 计算所有的矩阵变化后的矩阵，计算后可用currentMatrix
- (void)calcCurrentMatrix;

@end
