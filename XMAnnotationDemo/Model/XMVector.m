//
//  XMVector.m
//  XMAnnotationDemo
//
//  Created by fuqi on 2018/5/18.
//  Copyright © 2018年 fuqi. All rights reserved.
//

#import "XMVector.h"

@interface XMVector()

@end

@implementation XMVector

+ (NSArray *)identityVector
{
    static NSArray * identityVector;
    identityVector = @[@0,@0,@0];
    return identityVector;
}

- (instancetype)initWithArray:(NSArray<NSNumber *> *)array
{
    self = [super init];
    if (self)
    {
        _vectorArray = array;
    }
    return self;
}

- (instancetype)initWithPoint:(CGPoint)p
{
    self = [super init];
    if (self)
    {
        _vectorArray = @[@(p.x),@(p.y),@1];
    }
    return self;
}

- (CGPoint)getVectorPoint
{
    if (self.vectorArray.count != [XMVector identityVector].count)
    {
        return CGPointZero;
    }
    CGPoint p = CGPointMake([self.vectorArray[0] floatValue], [self.vectorArray[1] floatValue]);
    return p;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"[XMVector]:%@ %@ %@",
            [self.vectorArray safetyObjectAtIndex:0],
            [self.vectorArray safetyObjectAtIndex:1],
            [self.vectorArray safetyObjectAtIndex:2]];
}

@end
