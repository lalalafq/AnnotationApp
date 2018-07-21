//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "MJRefreshComponent.h"

@interface MJRefreshFooter : MJRefreshComponent
{
    _Bool _automaticallyHidden;
    double _ignoredScrollViewContentInsetBottom;
}

+ (id)footerWithRefreshingTarget:(id)arg1 refreshingAction:(SEL)arg2;
+ (id)footerWithRefreshingBlock:(CDUnknownBlockType)arg1;
@property(nonatomic, getter=isAutomaticallyHidden) _Bool automaticallyHidden; // @synthesize automaticallyHidden=_automaticallyHidden;
@property(nonatomic) double ignoredScrollViewContentInsetBottom; // @synthesize ignoredScrollViewContentInsetBottom=_ignoredScrollViewContentInsetBottom;
- (void)resetNoMoreData;
- (void)noticeNoMoreData;
- (void)endRefreshingWithNoMoreData;
- (void)willMoveToSuperview:(id)arg1;
- (void)prepare;

@end

