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
    
    int a00 = [a.matrixArray[0] intValue];
    int a01 = [a.matrixArray[1] intValue];
    int a02 = [a.matrixArray[2] intValue];
    int a10 = [a.matrixArray[3] intValue];
    int a11 = [a.matrixArray[4] intValue];
    int a12 = [a.matrixArray[5] intValue];
    int a20 = [a.matrixArray[6] intValue];
    int a21 = [a.matrixArray[7] intValue];
    int a22 = [a.matrixArray[8] intValue];
    
    int b00 = [b.matrixArray[0] intValue];
    int b01 = [b.matrixArray[1] intValue];
    int b02 = [b.matrixArray[2] intValue];
    int b10 = [b.matrixArray[3] intValue];
    int b11 = [b.matrixArray[4] intValue];
    int b12 = [b.matrixArray[5] intValue];
    int b20 = [b.matrixArray[6] intValue];
    int b21 = [b.matrixArray[7] intValue];
    int b22 = [b.matrixArray[8] intValue];
    
    int c0 = (b00 * a00) + (b01 * a10) + (b02 * a20);
    int c1 = (b00 * a01) + (b01 * a11) + (b02 * a21);
    int c2 = (b00 * a02) + (b01 * a12) + (b02 * a22);
    int c3 = (b10 * a00) + (b11 * a10) + (b12 * a20);
    int c4 = (b10 * a01) + (b11 * a11) + (b12 * a21);
    int c5 = (b10 * a02) + (b11 * a12) + (b12 * a22);
    int c6 = (b20 * a00) + (b21 * a10) + (b22 * a20);
    int c7 = (b20 * a01) + (b21 * a11) + (b22 * a21);
    int c8 = (b20 * a02) + (b21 * a12) + (b22 * a22);
    
    XMMatrix * resultMatrix = [[XMMatrix alloc] initWithArray:@[@(c0),@(c1),@(c2),@(c3),@(c4),@(c5),@(c6),@(c7),@(c8)]];
    return resultMatrix;
}

+ (XMVector *)multiplyVector:(XMVector *)v withMaxtrix:(XMMatrix *)m
{
    int m00 = [m.matrixArray[0] intValue];
    int m01 = [m.matrixArray[1] intValue];
    int m02 = [m.matrixArray[2] intValue];
    int m10 = [m.matrixArray[3] intValue];
    int m11 = [m.matrixArray[4] intValue];
    int m12 = [m.matrixArray[5] intValue];
    int m20 = [m.matrixArray[6] intValue];
    int m21 = [m.matrixArray[7] intValue];
    int m22 = [m.matrixArray[8] intValue];
    
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
    int a00 = [a.matrixArray[0] intValue];
    int a01 = [a.matrixArray[1] intValue];
    int a02 = [a.matrixArray[2] intValue];
    int a10 = [a.matrixArray[3] intValue];
    int a11 = [a.matrixArray[4] intValue];
    int a12 = [a.matrixArray[5] intValue];
    int a20 = [a.matrixArray[6] intValue];
    int a21 = [a.matrixArray[7] intValue];
    int a22 = [a.matrixArray[8] intValue];
    
    int b01 = (a22 * a11) - (a12 * a21);
    int b11 = (-a22 * a10) + (a12 * a20);
    int b21 = (a21 * a10) - (a11 * a20);
    
    int det = (a00 * b01) + (a01 * b11) + (a02 * b21);
    if (det == 0)
    {
        return a;
    }
    
    det = 1.0 / det;
    int c0 = b01 * det;
    int c1 = ((-a22 * a01) + (a02 * a21)) * det;
    int c2 = ((a12 * a01) - (a02 * a11)) * det;
    int c3 = b11 * det;
    int c4 = ((a22 * a00) - (a02 * a20)) * det;
    int c5 = ((-a12 * a00) + (a02 * a10)) * det;
    int c6 = b21 * det;
    int c7 = ((-a21 * a00) + (a01 * a20)) * det;
    int c8 = ((a11 * a00) - (a01 * a10)) * det;
    
    XMMatrix * resultMatrix = [[XMMatrix alloc] initWithArray:@[@(c0),@(c1),@(c2),@(c3),@(c4),@(c5),@(c6),@(c7),@(c8)]];
    return resultMatrix;
}

@end
