//
//  NSObject+Runtime.m
//  XMAnnotationDemo
//
//  Created by fuqi on 2018/7/13.
//  Copyright © 2018年 fuqi. All rights reserved.
//

#import "NSObject+Runtime.h"

#pragma mark - CKWeakHolder
@interface CKWeakHolder ()
@property (nonatomic, strong) NSValue *mValue;
@end
@implementation CKWeakHolder

+ (instancetype)holderWithObject:(id)object
{
    return [[CKWeakHolder alloc] initWithObject:object];
}


- (id)initWithObject:(id)object
{
    self = [self init];
#ifndef __clang_analyzer__
    void *p = malloc(sizeof(sizeof(void *)));
    objc_storeWeak((__autoreleasing id *)p, object);
    self.mValue = [NSValue valueWithPointer:p];
#endif
    return self;
}

- (id)holdedObject
{
    void *p = self.mValue.pointerValue;
    return objc_loadWeak((__autoreleasing id *)p);
}

- (void)dealloc
{
    void *p = self.mValue.pointerValue;
    if (p)
    {
        free(p);
    }
}
@end

@implementation NSObject (Runtime)

@dynamic customObject;
@dynamic customInfo;
@dynamic customArray;
@dynamic customActionBlock;
@dynamic customWeakObject;
@dynamic customTag;
@dynamic customIdenfitier;

static char sCustomObjectKey;
static char sCustomInfoKey;
static char sCustomArrayKey;
static char sCustomActionBlockKey;
static char sCustomWeakObjectKey;
static char sCustomTagKey;
static char sCustomIdenfitierKey;

#pragma mark - Setter
- (void)setCustomTag:(NSInteger)customTag
{
    objc_setAssociatedObject(self, &sCustomTagKey, @(customTag), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setCustomIdenfitier:(NSString *)customIdenfitier
{
    objc_setAssociatedObject(self, &sCustomIdenfitierKey, customIdenfitier, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setCustomObject:(id)aObject
{
    [self willChangeValueForKey:@"customObjectKey"];
    objc_setAssociatedObject(self, &sCustomObjectKey, aObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"customObjectKey"];
}

- (void)setCustomInfo:(NSMutableDictionary *)aInfo
{
    objc_setAssociatedObject(self, &sCustomInfoKey, aInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setCustomArray:(NSMutableArray *)aArray
{
    objc_setAssociatedObject(self, &sCustomArrayKey, aArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setCustomActionBlock:(void (^)(void))customActionBlock
{
    objc_setAssociatedObject(self, &sCustomActionBlockKey, customActionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setCustomWeakObject:(id)customWeakObject
{
    if (customWeakObject)
    {
        CKWeakHolder *holder = [CKWeakHolder holderWithObject:customWeakObject];
        objc_setAssociatedObject(self, &sCustomWeakObjectKey, holder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    else
    {
        objc_setAssociatedObject(self, &sCustomWeakObjectKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

#pragma mark - Getter
- (NSInteger)customTag
{
    NSNumber *numTag = objc_getAssociatedObject(self, &sCustomTagKey);
    return [numTag integerValue];
}

- (NSString *)customIdenfitier
{
    return objc_getAssociatedObject(self, &sCustomIdenfitierKey);
}

- (id)customObject
{
    id customObj = objc_getAssociatedObject(self, &sCustomObjectKey);
    return customObj;
}

- (NSMutableDictionary *)customInfo
{
    
    NSMutableDictionary *info = objc_getAssociatedObject(self, &sCustomInfoKey);
    if (!info) {
        info = [NSMutableDictionary dictionary];
        [self setCustomInfo:info];
    }
    return info;
}

- (NSMutableArray *)customArray
{
    return objc_getAssociatedObject(self, &sCustomArrayKey);
}

- (void (^)(void))customActionBlock
{
    return objc_getAssociatedObject(self, &sCustomActionBlockKey);
}

- (id)customWeakObject
{
    CKWeakHolder *holder = objc_getAssociatedObject(self, &sCustomWeakObjectKey);
    id obj = [holder holdedObject];
    if (!obj)
    {
        [self setCustomWeakObject:nil];
    }
    return obj;
}

@end
