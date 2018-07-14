//
//  XMAnnotationInfo.m
//  XMAnnotationDemo
//
//  Created by fuqi on 2018/5/17.
//  Copyright © 2018年 fuqi. All rights reserved.
//

#import "XMAnnotationInfo.h"

@implementation XMAnnotationInfo
#pragma mark - Utilitly
- (NSMutableArray<XMVector *> *)translatePointByOperation
{
    
    if (self.operationMatrix == 0)
    {
        return self.originPoints;
    }
    NSMutableArray * realPointArray = [NSMutableArray array];
    XMMatrix * totalMatrix = [XMMatrix identityMatrix];
    for (XMMatrix * m in self.operationMatrix)
    {
        totalMatrix = [XMCalculate multiplyMaxtrix:totalMatrix withMaxtrix:m];
    }
    if (self.parentAnnInfo.currentMatrix)
    {
        totalMatrix = [XMCalculate multiplyMaxtrix:totalMatrix withMaxtrix:self.parentAnnInfo.currentMatrix];
    }
    if (self.thenMatrix)
    {
        XMMatrix * invertMatrix = [XMCalculate invertMatrix:self.thenMatrix];
        totalMatrix = [XMCalculate multiplyMaxtrix:totalMatrix withMaxtrix:invertMatrix];
    }
    for (XMVector * originPoint in self.originPoints)
    {
        XMVector * realPoint = [XMCalculate multiplyVector:originPoint withMaxtrix:totalMatrix];
        [realPointArray safetyAddObject:realPoint];
    }
    NSLog(@"==============转化矩阵：%@",totalMatrix);
    NSLog(@"<<<<<<<<<<<<<<转换前：%@",self.originPoints);
    NSLog(@">>>>>>>>>>>>>>转换后：%@",realPointArray);
    return realPointArray;
}

- (void)calcCurrentMatrix
{
    XMMatrix * totalMatrix = [XMMatrix identityMatrix];
    for (XMMatrix * m in self.operationMatrix)
    {
        totalMatrix = [XMCalculate multiplyMaxtrix:totalMatrix withMaxtrix:m];
    }
    if (self.parentAnnInfo)
    {
        totalMatrix = [XMCalculate multiplyMaxtrix:totalMatrix withMaxtrix:self.parentAnnInfo.currentMatrix];
    }
    self.currentMatrix = totalMatrix;
}

#pragma mark - Lazy
- (NSMutableArray<XMVector *> *)originPoints
{
    if (!_originPoints)
    {
        _originPoints = [NSMutableArray array];
    }
    return _originPoints;
}

//- (NSMutableArray<XMVector *> *)realPoints
//{
//    if (!_realPoints)
//    {
//        _realPoints = [NSMutableArray array];
//    }
//
//    return _realPoints;
//}

- (NSMutableArray<XMMatrix *> *)operationMatrix
{
    if (!_operationMatrix)
    {
        _operationMatrix = [NSMutableArray array];
    }
    return _operationMatrix;
}




@end
