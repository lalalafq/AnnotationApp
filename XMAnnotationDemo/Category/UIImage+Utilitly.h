//
//  UIImage+Utilitly.h
//  XMAnnotationDemo
//
//  Created by fuqi on 2018/7/12.
//  Copyright © 2018年 fuqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utilitly)

/// 等比压缩图片（按像素）
- (UIImage *)compressImageWithPixelSize:(CGSize)pixelSize;
/// 等比压缩图片（按point）
- (UIImage *)compressImageWithPointSize:(CGSize)pointSize;
/// 图片裁减（按point缩放）
- (UIImage *)generatePhotoThumbnailWithSize:(CGSize)thumbnailSize;
///图片叠加
-(UIImage *)addImage:(UIImage *)image1 edgeInsets:(UIEdgeInsets)insets;
/// 方向调整
- (UIImage *)fixOrientation;

+ (UIImage *)imageWithStartColor:(UIColor *)color endColor:(UIColor *)color size:(CGSize)size;

@end
