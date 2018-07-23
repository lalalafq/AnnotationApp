//
//  XMCalculate.m
//  XMAnnotationDemo
//
//  Created by fuqi on 2018/5/18.
//  Copyright © 2018年 fuqi. All rights reserved.
//

#import "XMCalculate.h"
#import "XMVector.h"
#import "XMMatrix.h"

@implementation XMCalculate

+ (XMMatrix *)multiplyMaxtrix:(XMMatrix *)a withMaxtrix:(XMMatrix *)b
{
    a = a ?: [XMMatrix identityMatrix];
    b = b ?: [XMMatrix identityMatrix];
    
    CGFloat a00 = [a.matrixArray[0] floatValue];
    CGFloat a01 = [a.matrixArray[1] floatValue];
    CGFloat a02 = [a.matrixArray[2] floatValue];
    CGFloat a10 = [a.matrixArray[3] floatValue];
    CGFloat a11 = [a.matrixArray[4] floatValue];
    CGFloat a12 = [a.matrixArray[5] floatValue];
    CGFloat a20 = [a.matrixArray[6] floatValue];
    CGFloat a21 = [a.matrixArray[7] floatValue];
    CGFloat a22 = [a.matrixArray[8] floatValue];
    
    CGFloat b00 = [b.matrixArray[0] floatValue];
    CGFloat b01 = [b.matrixArray[1] floatValue];
    CGFloat b02 = [b.matrixArray[2] floatValue];
    CGFloat b10 = [b.matrixArray[3] floatValue];
    CGFloat b11 = [b.matrixArray[4] floatValue];
    CGFloat b12 = [b.matrixArray[5] floatValue];
    CGFloat b20 = [b.matrixArray[6] floatValue];
    CGFloat b21 = [b.matrixArray[7] floatValue];
    CGFloat b22 = [b.matrixArray[8] floatValue];
    
    CGFloat c0 = (a00 * b00) + (a01 * b10) + (a02 * b20);
    CGFloat c1 = (a00 * b01) + (a01 * b11) + (a02 * b21);
    CGFloat c2 = (a00 * b02) + (a01 * b12) + (a02 * b22);
    CGFloat c3 = (a10 * b00) + (a11 * b10) + (a12 * b20);
    CGFloat c4 = (a10 * b01) + (a11 * b11) + (a12 * b21);
    CGFloat c5 = (a10 * b02) + (a11 * b12) + (a12 * b22);
    CGFloat c6 = (a20 * b00) + (a21 * b10) + (a22 * b20);
    CGFloat c7 = (a20 * b01) + (a21 * b11) + (a22 * b21);
    CGFloat c8 = (a20 * b02) + (a21 * b12) + (a22 * b22);
    
    XMMatrix * resultMatrix = [[XMMatrix alloc] initWithArray:@[@(c0),@(c1),@(c2),@(c3),@(c4),@(c5),@(c6),@(c7),@(c8)]];
    return resultMatrix;
}

+ (XMVector *)multiplyVector:(XMVector *)v withMaxtrix:(XMMatrix *)m
{
    CGFloat m00 = [m.matrixArray[0] floatValue];
    CGFloat m01 = [m.matrixArray[1] floatValue];
    CGFloat m02 = [m.matrixArray[2] floatValue];
    CGFloat m10 = [m.matrixArray[3] floatValue];
    CGFloat m11 = [m.matrixArray[4] floatValue];
    CGFloat m12 = [m.matrixArray[5] floatValue];
    CGFloat m20 = [m.matrixArray[6] floatValue];
    CGFloat m21 = [m.matrixArray[7] floatValue];
    CGFloat m22 = [m.matrixArray[8] floatValue];
    
    int x = [v.vectorArray[0] intValue];
    int y = [v.vectorArray[1] intValue];
    int z = [v.vectorArray[2] intValue];
    
    int v0 = (x * m00) + (y * m10) + (z * m20);
    int v1 = (x * m01) + (y * m11) + (z * m21);
    int v2 = (x * m02) + (y * m12) + (z * m22);
    
    XMVector * resultVector = [[XMVector alloc] initWithArray:@[@(v0),@(v1),@(v2)]];
    return resultVector;
}

+ (XMMatrix *)invertMatrix:(XMMatrix *)a
{
    CGFloat a00 = [a.matrixArray[0] floatValue];
    CGFloat a01 = [a.matrixArray[1] floatValue];
    CGFloat a02 = [a.matrixArray[2] floatValue];
    CGFloat a10 = [a.matrixArray[3] floatValue];
    CGFloat a11 = [a.matrixArray[4] floatValue];
    CGFloat a12 = [a.matrixArray[5] floatValue];
    CGFloat a20 = [a.matrixArray[6] floatValue];
    CGFloat a21 = [a.matrixArray[7] floatValue];
    CGFloat a22 = [a.matrixArray[8] floatValue];
    
    CGFloat b01 = (a22 * a11) - (a12 * a21);
    CGFloat b11 = (-a22 * a10) + (a12 * a20);
    CGFloat b21 = (a21 * a10) - (a11 * a20);
    
    CGFloat det = (a00 * b01) + (a01 * b11) + (a02 * b21);
    if (det == 0)
    {
        return a;
    }
    
    det = 1.0 / det;
    CGFloat c0 = b01 * det;
    CGFloat c1 = ((-a22 * a01) + (a02 * a21)) * det;
    CGFloat c2 = ((a12 * a01) - (a02 * a11)) * det;
    CGFloat c3 = b11 * det;
    CGFloat c4 = ((a22 * a00) - (a02 * a20)) * det;
    CGFloat c5 = ((-a12 * a00) + (a02 * a10)) * det;
    CGFloat c6 = b21 * det;
    CGFloat c7 = ((-a21 * a00) + (a01 * a20)) * det;
    CGFloat c8 = ((a11 * a00) - (a01 * a10)) * det;
    
    XMMatrix * resultMatrix = [[XMMatrix alloc] initWithArray:@[@(c0),@(c1),@(c2),@(c3),@(c4),@(c5),@(c6),@(c7),@(c8)]];
    return resultMatrix;
}

@end
