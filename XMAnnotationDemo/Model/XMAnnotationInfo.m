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


- (void)reCalculateRealPoints
{
    if (self.operationMatrix == 0)
    {
        self.realPoints = self.originPoints;
    }
    NSMutableArray * realPointArray = [NSMutableArray array];
    XMMatrix * totalMatrix = self.operationMatrix.count > 0 ? [self.operationMatrix firstObject] : [XMMatrix identityMatrix];
    /// 首先计算所有的操作矩阵积
    for (XMMatrix * m in self.operationMatrix)
    {
        totalMatrix = [XMCalculate multiplyMaxtrix:totalMatrix withMaxtrix:m];
    }
    /// 如果父视图也有矩阵变换则需要计算父视图的矩阵积
    if (self.parentAnnInfo.currentMatrix)
    {
        totalMatrix = [XMCalculate multiplyMaxtrix:totalMatrix withMaxtrix:self.parentAnnInfo.currentMatrix];
    }
    /// 如果在绘制的时候父视图已经有操作矩阵了，则需要计算它的逆矩阵（相当于回退）
    if (self.thenMatrix)
    {
        XMMatrix * invertMatrix = [XMCalculate invertMatrix:self.thenMatrix];
        totalMatrix = [XMCalculate multiplyMaxtrix:invertMatrix withMaxtrix:totalMatrix];
    }
    for (XMVector * originPoint in self.originPoints)
    {
        XMVector * realPoint = [XMCalculate multiplyVector:originPoint withMaxtrix:totalMatrix];
        [realPointArray safetyAddObject:realPoint];
    }
    NSLog(@"==============转化矩阵：%@",totalMatrix);
    NSLog(@"<<<<<<<<<<<<<<转换前：%@",self.originPoints);
    NSLog(@">>>>>>>>>>>>>>转换后：%@",realPointArray);
    
    self.realPoints = realPointArray;
}

// TODO:[优化]当进行平移式，会有多个矩阵进入数组，需要将这些矩阵合并。
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
