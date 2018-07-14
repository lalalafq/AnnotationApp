//
//  XMMatrix.m
//  XMAnnotationDemo
//
//  Created by fuqi on 2018/5/18.
//  Copyright © 2018年 fuqi. All rights reserved.
//

#import "XMMatrix.h"
#import <math.h>

@interface XMMatrix()

@end

@implementation XMMatrix

+ (XMMatrix *)identityMatrix
{
    static NSArray * identityArray;
    identityArray = @[@1,@0,@0,@0,@1,@0,@0,@0,@1];
    XMMatrix * identityMatrix = [[XMMatrix alloc] initWithArray:identityArray];
    return identityMatrix;
}

+ (XMMatrix *)translateMatrixWithX:(int)dx withY:(int)dy
{
    NSArray * translateArray = @[@1,@0,@0,@0,@1,@0,@(dx),@(dy),@1];
    XMMatrix * translateMatrix = [[XMMatrix alloc] initWithArray:translateArray];
    return translateMatrix;
}

+ (XMMatrix *)rotateMatrix:(double)delta
{
    double radian = delta / 180 * M_PI;
    NSArray * rotateArray = @[@(cos(radian)),@(sin(radian)),@0,
                              @(-sin(radian)),@(cos(radian)),@0,
                              @0,@0,@1];
    XMMatrix * rotateMatrix = [[XMMatrix alloc] initWithArray:rotateArray];
    return rotateMatrix;
}

+ (XMMatrix *)scaleMatrixWithX:(double)sx withY:(double)sy
{
    NSArray * scaleArray = @[@(sx),@0,@0,
                              @0,@(sy),@0,
                              @0,@0,@1];
    XMMatrix * scaleMatrix = [[XMMatrix alloc] initWithArray:scaleArray];
    return scaleMatrix;
}



- (instancetype)initWithArray:(NSArray<NSNumber *> *)array
{
    self = [super init];
    if (self)
    {
        _matrixArray = array;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"[XMMatrix]:%@ %@ %@ %@ %@ %@ %@ %@ %@",
            [self.matrixArray safetyObjectAtIndex:0],
            [self.matrixArray safetyObjectAtIndex:1],
            [self.matrixArray safetyObjectAtIndex:2],
            [self.matrixArray safetyObjectAtIndex:3],
            [self.matrixArray safetyObjectAtIndex:4],
            [self.matrixArray safetyObjectAtIndex:5],
            [self.matrixArray safetyObjectAtIndex:6],
            [self.matrixArray safetyObjectAtIndex:7],
            [self.matrixArray safetyObjectAtIndex:8]];
}




@end

