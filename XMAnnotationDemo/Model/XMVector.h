//
//  XMVector.h
//  XMAnnotationDemo
//
//  Created by fuqi on 2018/5/18.
//  Copyright © 2018年 fuqi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMVector : NSObject

@property (nonatomic,strong,readonly)NSArray <NSNumber *> * vectorArray;


- (instancetype)initWithPoint:(CGPoint)p;
- (instancetype)initWithArray:(NSArray <NSNumber *> *)array;

- (CGPoint)getVectorPoint;
/// 元向量
+ (NSArray *)identityVector;


@end
