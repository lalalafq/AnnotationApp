//
//  NSObject+Runtime.h
//  XMAnnotationDemo
//
//  Created by fuqi on 2018/7/13.
//  Copyright © 2018年 fuqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface CKWeakHolder : NSObject
+ (instancetype)holderWithObject:(id)object;
- (id)initWithObject:(id)object;
- (id)holdedObject;
@end

@interface NSObject (Runtime)

@property (nonatomic, strong) id customObject;
@property (nonatomic, strong) NSMutableDictionary *customInfo;
@property (nonatomic, strong) NSMutableArray *customArray;
@property (nonatomic, copy) void (^customActionBlock)(void);
@property (nonatomic, weak) id customWeakObject;
@property (nonatomic, assign) NSInteger customTag;
@property (nonatomic, strong) NSString *customIdenfitier;

@end
