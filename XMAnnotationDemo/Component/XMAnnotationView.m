//
//  XMAnnotationView.m
//  XMAnnotationDemo
//
//  Created by fuqi on 2018/5/17.
//  Copyright © 2018年 fuqi. All rights reserved.
//

#import "XMAnnotationView.h"
#import "XMAnnotationInfo.h"
#import "UIImage+FixOrientation.h"
#import <math.h>


@interface XMAnnotationView()// 正在拖拽中的图形。

@property (nonatomic)CGContextRef cxt;

// 已绘制的图像,有几个框数组中就有几个元素
@property (nonatomic,strong)NSMutableArray <XMAnnotationInfo *> * graphicsArray;
// 正在拖拽中的图形。
@property (nonatomic,strong)XMAnnotationInfo * draggingInfo;
// 正在拖拽的原始点。(用于移动处理)
@property (nonatomic)CGPoint draggingOriginPoint;
// 正在缩放的原始矩形。(用于缩放处理)
@property (nonatomic)CGRect zoomingOriginRect;
// 当前图片的信息（把图片也当成一个标注样式）
@property (nonatomic,strong)XMAnnotationInfo * bgImgInfo;
//// 当前操作的矩阵变换
//@property (nonatomic,strong)XMMatrix * currentOperationMatrix;
/// 隐藏标志
@property (nonatomic)BOOL hiddenAllRectFlag;

@property (nonatomic)CGFloat screenDiagonalLength;

@end

@implementation XMAnnotationView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _screenDiagonalLength = [self getDiagonalLength:[UIScreen mainScreen].bounds];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    
    NSLog(@"*******************drawRect*******************");
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    _cxt = context;
    UIGraphicsBeginImageContext(self.bounds.size);
    /// 画背景图
    [self drawBgImg:context andRect:rect];

    
    if (!self.hiddenAllRectFlag)
    {
        /// 画框
        [self drawCustomRect:context];
    }
    
    UIGraphicsEndImageContext();
}

// 画背景图
- (void)drawBgImg:(CGContextRef)context andRect:(CGRect)rect
{
//    return;
    if (self.bgImgInfo.originPoints.count < 4)
    {
        [self initCurrentBgInfo:rect];
    }
    [self.bgImgInfo reCalculateRealPoints];
    NSArray <XMVector *> * realPoints = self.bgImgInfo.realPoints;
    CGPoint p0 = [realPoints objectAtIndex:0].getVectorPoint;
    CGPoint p2 = [realPoints objectAtIndex:2].getVectorPoint;
    CGRect imageRect = CGRectMake(MIN(p0.x , p2.x),
                              MIN(p0.y , p2.y),
                              ABS(p0.x - p2.x),
                              ABS(p0.y - p2.y));
    CGLayerRef cg = CGLayerCreateWithContext(context, self.image.size, NULL);
    //需要将CGLayerContext来作为缓存context，这个是必须的
    CGContextRef layerContext = CGLayerGetContext(cg);
    CGContextDrawImage(layerContext, imageRect, self.image.CGImage);
    CGContextDrawLayerAtPoint(context, CGPointMake(0, 0), cg);
}

// 画框
- (void)drawCustomRect:(CGContextRef)context
{
    //设置相关参数
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextSetLineWidth(context, 1.0);
    CGContextSetLineCap(context, kCGLineCapSquare);
    CGContextSetLineJoin(context, kCGLineJoinMiter);
    
    [self.bgImgInfo calcCurrentMatrix];
    /// 绘制之前的框
    for (XMAnnotationInfo * info in self.graphicsArray)
    {
        [info reCalculateRealPoints];
        NSArray <XMVector *> * realPoints = info.realPoints;
        CGPoint p0 = [realPoints objectAtIndex:0].getVectorPoint;
        CGPoint p1 = [realPoints objectAtIndex:1].getVectorPoint;
        CGPoint p2 = [realPoints objectAtIndex:2].getVectorPoint;
        CGPoint p3 = [realPoints objectAtIndex:3].getVectorPoint;
        
        CGContextMoveToPoint(context, p0.x, p0.y);
        CGContextAddLineToPoint(context, p1.x, p1.y);
        CGContextAddLineToPoint(context, p2.x, p2.y);
        CGContextAddLineToPoint(context, p3.x, p3.y);
        CGContextAddLineToPoint(context, p0.x, p0.y);
        CGContextStrokePath(context);
    }
    
    /// 绘制正在过拽的框
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    [self.draggingInfo reCalculateRealPoints];
    NSArray <XMVector *> * realPoints = self.draggingInfo.realPoints;
    CGPoint p0 = [realPoints objectAtIndex:0].getVectorPoint;
    CGPoint p1 = [realPoints objectAtIndex:1].getVectorPoint;
    CGPoint p2 = [realPoints objectAtIndex:2].getVectorPoint;
    CGPoint p3 = [realPoints objectAtIndex:3].getVectorPoint;
    
    CGContextMoveToPoint(context, p0.x, p0.y);
    CGContextAddLineToPoint(context, p1.x, p1.y);
    CGContextAddLineToPoint(context, p2.x, p2.y);
    CGContextAddLineToPoint(context, p3.x, p3.y);
    CGContextAddLineToPoint(context, p0.x, p0.y);
    CGContextStrokePath(context);
}

#pragma mark - Touch生命周期
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    XMVector * pointVector = [[XMVector alloc] initWithPoint:touchPoint];
    NSLog(@"*******************触碰开始*******************%@:%@",NSStringFromCGPoint(touchPoint),@(touches.count));
    
    
    //
    if (self.annotationType == AnnotationTypeDraw)
    {
        self.draggingInfo = [[XMAnnotationInfo alloc] init];
        self.draggingInfo.parentAnnInfo = self.bgImgInfo;
        self.draggingInfo.thenMatrix = self.bgImgInfo.currentMatrix;
        [self.draggingInfo.originPoints addObject:pointVector];
    }
    else if (self.annotationType == AnnotationTypeMove)
    {
        NSLog(@"----------------移动开始------------------");
        self.draggingOriginPoint = touchPoint;
        [self findLocateRect:touchPoint];
        
        CGFloat dx = touchPoint.x - self.draggingOriginPoint.x;
        CGFloat dy = touchPoint.y - self.draggingOriginPoint.y;
        XMMatrix * m = [XMMatrix translateMatrixWithX:dx withY:dy];
        NSLog(@"XMMatrix : %@",m);
        if (self.draggingInfo)
        {
            [self.draggingInfo.operationMatrix safetyAddObject:m];
        }
        else
        {
            [self.bgImgInfo.operationMatrix safetyAddObject:m];
        }
    }
    else if (self.annotationType == AnnotationTypeZoom)
    {
        if (touches.count == 2)
        {
            UITouch *touch1 = [[touches objectEnumerator] allObjects][0];
            CGPoint touchPoint1 = [touch1 locationInView:self];
            UITouch *touch2 = [[touches objectEnumerator] allObjects][1];
            CGPoint touchPoint2 = [touch2 locationInView:self];
            self.zoomingOriginRect = [self generateRectByPoint:touchPoint1 other:touchPoint2];
        }
    }
    else if (self.annotationType == AnnotationTypeErasure)
    {
        [self findLocateRect:touchPoint];
        [self.graphicsArray safetyRemoveObject:self.draggingInfo];
        self.draggingInfo = nil;
        [self setNeedsDisplay];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    NSLog(@"*******************触碰移动*******************%@:%@",NSStringFromCGPoint(touchPoint),@(touches.count));
    
    if (self.annotationType == AnnotationTypeDraw)
    {
        if (self.draggingInfo.originPoints.count == 0)
        {
            return;
        }
        if (self.draggingInfo.originPoints.count > 1)
        {
            [self.draggingInfo.originPoints removeObjectsInRange:NSMakeRange(1, self.draggingInfo.originPoints.count - 2)];
        }
        
        [self touchMoveForTypeDraw:touchPoint];
        [self setNeedsDisplay];
    }
    else if (self.annotationType == AnnotationTypeMove)
    {
        [self touchMoveForTypeMove:touchPoint];
        [self setNeedsDisplay];
    }
    else if (self.annotationType == AnnotationTypeZoom)
    {
        if (touches.count == 2)
        {
            
            UITouch *touch1 = [[touches objectEnumerator] allObjects][0];
            CGPoint touchPoint1 = [touch1 locationInView:self];
            UITouch *touch2 = [[touches objectEnumerator] allObjects][1];
            CGPoint touchPoint2 = [touch2 locationInView:self];
            CGRect rect = [self generateRectByPoint:touchPoint1 other:touchPoint2];
            if (CGRectEqualToRect(self.zoomingOriginRect, rect))
            {
                return;
            }
            CGFloat length = [self getDiagonalLength:rect];
            CGFloat lastLength = [self getDiagonalLength:self.zoomingOriginRect];
            CGFloat diff = length - lastLength;
            CGFloat ratio = 1 + diff / self.screenDiagonalLength;
            ratio = MIN(MAX(ratio, 0.8),3.0);
            XMMatrix * zoomM = [XMMatrix scaleMatrixWithX:ratio withY:ratio];
            [self.bgImgInfo.operationMatrix safetyAddObjectsFromArray:@[zoomM]];
            [self setNeedsDisplay];
            
            self.zoomingOriginRect = rect;
        }
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    NSLog(@"*******************触碰结束*******************%@",NSStringFromCGPoint(touchPoint));
    
    if (self.annotationType == AnnotationTypeDraw)
    {
        if (self.draggingInfo.originPoints.count == 0)
        {
            return;
        }
        if (self.draggingInfo.originPoints.count > 1)
        {
            [self.draggingInfo.originPoints removeObjectsInRange:NSMakeRange(1, self.draggingInfo.originPoints.count - 2)];
        }
        XMVector * v0 = [self.draggingInfo.originPoints objectAtIndex:0];
        XMVector * pointVector = [[XMVector alloc] initWithPoint:touchPoint];
        CGPoint p0 = v0.getVectorPoint;
        CGPoint p2 = pointVector.getVectorPoint;
        if (CGPointEqualToPoint(p0,p2))
        {
            // 两点一样，则认为是选中。寻找命中区域
            NSLog(@"----------------寻找命中区域------------------");
            [self findLocateRect:p0];
            return;
        }
        if (![self checkMinSize:p0 other:p2])
        {
            NSLog(@"----------------小于最小标注区域------------------");
            // 小于最小标注则忽略
            self.draggingInfo = nil;
            [self setNeedsDisplay];
            return;
        }
        [self touchEndForTypeDraw:touchPoint];
        [self setNeedsDisplay];
    }
    else if (self.annotationType == AnnotationTypeMove)
    {
        NSLog(@"----------------移动结束------------------");
        [self touchMoveForTypeMove:touchPoint];
        [self setNeedsDisplay];
    }
    else if (self.annotationType == AnnotationTypeZoom)
    {
        
    }
    else if (self.annotationType == AnnotationTypeErasure)
    {
        
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    XMVector * pointVector = [[XMVector alloc] initWithPoint:touchPoint];
    NSLog(@"*******************触碰取消*******************%@",NSStringFromCGPoint(touchPoint));
    //
    //    if (self.draggingInfo.points.count == 0)
    //    {
    //        return;
    //    }
    //    if (self.draggingInfo.points.count > 1)
    //    {
    //        [self.draggingInfo.points removeObjectsInRange:NSMakeRange(1, self.draggingInfo.points.count - 2)];
    //    }
    //    XMVector * v1 = [self.draggingInfo.points objectAtIndex:0];
    //    CGPoint p1 = v1.getVectorPoint;
    //    CGPoint p3 = pointVector.getVectorPoint;
    //    CGPoint p2 = CGPointMake(p1.x, p3.y);
    //    CGPoint p4 = CGPointMake(p3.x, p1.y);
    //    XMVector * v2 = [[XMVector alloc] initWithPoint:p2];
    //    XMVector * v3 = [[XMVector alloc] initWithPoint:p3];
    //    XMVector * v4 = [[XMVector alloc] initWithPoint:p4];
    //    [self.draggingInfo.points removeAllObjects];
    //    [self.draggingInfo.points addObjectsFromArray:@[v1,v2,v3,v4]];
    //    [self.graphicsArray addObject:self.draggingInfo];
}

#pragma mark - 从touch回调中重构的方法
- (void)touchMoveForTypeMove:(CGPoint)touchPoint
{
    CGFloat dx = touchPoint.x - self.draggingOriginPoint.x;
    CGFloat dy = touchPoint.y - self.draggingOriginPoint.y;
    XMMatrix * m = [XMMatrix translateMatrixWithX:dx withY:dy];
    if (self.draggingInfo)
    {
        [self.draggingInfo.operationMatrix safetyRemoveObjectAtIndex:self.draggingInfo.operationMatrix.count - 1];
        [self.draggingInfo.operationMatrix safetyAddObject:m];
    }
    else
    {
        [self.bgImgInfo.operationMatrix safetyRemoveObjectAtIndex:self.bgImgInfo.operationMatrix.count - 1];
        [self.bgImgInfo.operationMatrix safetyAddObject:m];
    }
}

- (void)touchMoveForTypeDraw:(CGPoint)touchPoint
{
    XMVector * pointVector = [[XMVector alloc] initWithPoint:touchPoint];
    XMVector * v0 = [self.draggingInfo.originPoints objectAtIndex:0];
    CGPoint p0 = v0.getVectorPoint;
    CGPoint p2 = pointVector.getVectorPoint;
    CGPoint p1 = CGPointMake(p0.x, p2.y);
    CGPoint p3 = CGPointMake(p2.x, p0.y);
    XMVector * v1 = [[XMVector alloc] initWithPoint:p1];
    XMVector * v2 = [[XMVector alloc] initWithPoint:p2];
    XMVector * v3 = [[XMVector alloc] initWithPoint:p3];
    [self.draggingInfo.originPoints removeAllObjects];
    [self.draggingInfo.originPoints addObjectsFromArray:@[v0,v1,v2,v3]];
}

- (void)touchEndForTypeDraw:(CGPoint)touchPoint
{
    XMVector * pointVector = [[XMVector alloc] initWithPoint:touchPoint];
    XMVector * v0 = [self.draggingInfo.originPoints objectAtIndex:0];
    CGPoint p0 = v0.getVectorPoint;
    CGPoint p2 = pointVector.getVectorPoint;
    CGPoint p1 = CGPointMake(p0.x, p2.y);
    CGPoint p3 = CGPointMake(p2.x, p0.y);
    XMVector * v1 = [[XMVector alloc] initWithPoint:p1];
    XMVector * v2 = [[XMVector alloc] initWithPoint:p2];
    XMVector * v3 = [[XMVector alloc] initWithPoint:p3];
    [self.draggingInfo.originPoints removeAllObjects];
    [self.draggingInfo.originPoints addObjectsFromArray:@[v0,v1,v2,v3]];
    [self.graphicsArray addObject:self.draggingInfo];
    
    self.draggingInfo = nil;
}

#pragma mark - 处理事件
- (void)cleanAllRect
{
    self.draggingInfo = nil;
    [self.graphicsArray removeAllObjects];
    [self.bgImgInfo.operationMatrix removeAllObjects];
    [self setNeedsDisplay];
}

- (void)clockwiseRatation
{
    self.image = [self.image imageRotatedByDegrees:-90.0f];
    NSArray <XMVector *> * realPoints = self.bgImgInfo.realPoints;
    CGPoint p0 = [realPoints objectAtIndex:0].getVectorPoint;
    CGPoint p2 = [realPoints objectAtIndex:2].getVectorPoint;
    CGPoint originPoint = [self getMiddlePointByPoint:p0 other:p2];
    XMMatrix * ratationM = [XMMatrix rotateMatrix:90.0f originPoint:originPoint];
    [self.bgImgInfo.operationMatrix safetyAddObjectsFromArray:@[ratationM]];
    [self setNeedsDisplay];
}


- (void)antiClockwiseRatation
{
    self.image = [self.image imageRotatedByDegrees:90.0f];
    NSArray <XMVector *> * realPoints = self.bgImgInfo.realPoints;
    CGPoint p0 = [realPoints objectAtIndex:0].getVectorPoint;
    CGPoint p2 = [realPoints objectAtIndex:2].getVectorPoint;
    CGPoint originPoint = [self getMiddlePointByPoint:p0 other:p2];
    XMMatrix * ratationM = [XMMatrix rotateMatrix:-90.0f originPoint:originPoint];
    [self.bgImgInfo.operationMatrix safetyAddObjectsFromArray:@[ratationM]];
    [self setNeedsDisplay];
}

- (void)hiddenAllRect
{
    self.hiddenAllRectFlag = !self.hiddenAllRectFlag;
    [self setNeedsDisplay];
}

- (void)undo
{
    UIGraphicsPopContext();
}

- (void)handleUp
{
}

- (void)handleDown
{}

- (void)handleLeft
{}

- (void)handleRight
{}

- (void)handleBlank
{
    [self setNeedsDisplay];
}

#pragma mark - Utilily
- (BOOL)findLocateRect:(CGPoint)p
{
    NSMutableArray * locateRectArray = [NSMutableArray array];
    for (XMAnnotationInfo * info in self.graphicsArray)
    {
        NSArray <XMVector *> * realPoints = info.realPoints;
        CGPoint p0 = [realPoints objectAtIndex:0].getVectorPoint;
        CGPoint p2 = [realPoints objectAtIndex:2].getVectorPoint;
        
        CGRect rect = CGRectMake(MIN(p0.x, p2.x),MIN(p0.y,p2.y),ABS(p0.x - p2.x),ABS(p0.y - p2.y));
        if (CGRectContainsPoint(rect, p))
        {
            // 先将命中的框信息加入到数组中
            [locateRectArray addObject:info];
            NSLog(@"findLocateRect : 命中一个目标");
        }
    }
    
    if (locateRectArray.count == 0)
    {
        self.draggingInfo = nil;
        [self setNeedsDisplay];
        return NO;
    }
    NSArray * locateRectReverseArray = [[locateRectArray reverseObjectEnumerator] allObjects];
    // 判断框信息
    XMAnnotationInfo * locateInfo = [locateRectReverseArray safetyObjectAtIndex:0];
    for (XMAnnotationInfo * info0 in locateRectReverseArray)
    {
        NSArray <XMVector *> * realPoints0 = info0.realPoints;
        CGPoint p0_0 = [realPoints0 objectAtIndex:0].getVectorPoint;
        CGPoint p0_2 = [realPoints0 objectAtIndex:2].getVectorPoint;
        
        CGRect rect0 = [self generateRectByPoint:p0_0 other:p0_2];
        for (XMAnnotationInfo * info1 in locateRectArray)
        {
            if (info0 == info1)
            {
                continue;
            }
            
            NSArray <XMVector *> * realPoints1 = info1.realPoints;
            CGPoint p1_0 = [realPoints1 objectAtIndex:0].getVectorPoint;
            CGPoint p1_2 = [realPoints1 objectAtIndex:2].getVectorPoint;
            
            CGRect rect1 = [self generateRectByPoint:p1_0 other:p1_2];
            
            if (CGRectContainsRect(rect1, rect0))
            {
                // 如果被包含，则增加次数
                info0.customTag++;
            }
        }
        
        if (info0.customTag > locateInfo.customTag)
        {
            locateInfo = info0;
        }
    }
    
    // 找到最终定位画框
    self.draggingInfo = locateInfo;
    
    [self setNeedsDisplay];
    
    return YES;
}

- (void)initCurrentBgInfo:(CGRect)rect
{
    self.image = [self.image imageRotatedByDegrees:180];
    CGFloat originImageWidth = self.image.size.width;
    CGFloat originImageHeight = self.image.size.height;
    CGFloat imageRatio = originImageWidth / originImageHeight;
    CGFloat viewRatio = rect.size.width / rect.size.height;
    
    CGFloat imageWidth = 0,imageHeight = 0;
    
    if (imageRatio > viewRatio) {
        imageWidth = rect.size.width;
        imageHeight = imageWidth / imageRatio;
    } else {
        imageHeight = rect.size.height;
        imageWidth = imageHeight * imageRatio;
    }
    
    /// 计算左上角位置
    CGFloat offsetX = 0,offsetY = 0;
    offsetX = (rect.size.width - imageWidth) / 2;
    offsetY = (rect.size.height - imageHeight) / 2;
    
    CGPoint point0 = CGPointMake(offsetX, offsetY);
    CGPoint point1 = CGPointMake(offsetX, offsetY + imageHeight);
    CGPoint point2 = CGPointMake(offsetX + imageWidth, offsetY + imageHeight);
    CGPoint point3 = CGPointMake(offsetX + imageWidth, offsetY);
    
    XMVector * v0 = [[XMVector alloc] initWithPoint:point0];
    XMVector * v1 = [[XMVector alloc] initWithPoint:point1];
    XMVector * v2 = [[XMVector alloc] initWithPoint:point2];
    XMVector * v3 = [[XMVector alloc] initWithPoint:point3];
    
    [_bgImgInfo.originPoints safetyAddObjectsFromArray:@[v0,v1,v2,v3]];
}

- (BOOL)checkMinSize:(CGPoint)point1 other:(CGPoint)point2
{
    CGFloat width = ABS(point1.x - point2.x);
    CGFloat height = ABS(point1.y - point2.y);
    if (width < self.annotationMinWidth && height < self.annotationMinHeight)
    {
        return NO;
    }
    return YES;
}

- (BOOL)checkPointEqual:(CGPoint)point1 other:(CGPoint)point2
{
    if (point1.x == point2.x && point1.y == point2.y)
    {
        return YES;
    }
    return NO;
}

- (CGRect)generateRectByPoint:(CGPoint)point1 other:(CGPoint)point2
{
    CGRect rect1 = CGRectMake(MIN(point1.x , point2.x),
                              MIN(point1.y , point2.y),
                              ABS(point1.x - point2.x),
                              ABS(point1.y - point2.y));
    return rect1;
}

- (CGPoint)getMiddlePointByPoint:(CGPoint)point1 other:(CGPoint)point2
{
    CGPoint p = CGPointMake(MIN(point1.x , point2.x) + ABS(point1.x - point2.x) / 2.0,
                            MIN(point1.y , point2.y) + ABS(point1.y - point2.y) / 2.0);
    return p;
}

- (CGFloat)getDiagonalLength:(CGRect)rect
{
    CGFloat length = sqrt(rect.size.width * rect.size.width + rect.size.height * rect.size.height);
    return length;
}


#pragma mark - Lazy
- (NSMutableArray<XMAnnotationInfo *> *)graphicsArray
{
    if (!_graphicsArray)
    {
        _graphicsArray = [NSMutableArray array];
    }
    return _graphicsArray;
}

- (XMAnnotationInfo *)bgImgInfo
{
    if (!_bgImgInfo)
    {
        _bgImgInfo = [[XMAnnotationInfo alloc] init];
    }
    return _bgImgInfo;
}



@end
