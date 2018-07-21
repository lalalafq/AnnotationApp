//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSObject.h"

@class SYPaginatorView, UIView;

@protocol SYPaginatorViewDelegate <NSObject>

@optional
- (void)paginatorView:(SYPaginatorView *)arg1 didScrollToPageAtIndex:(long long)arg2;
- (void)paginatorView:(SYPaginatorView *)arg1 willDisplayView:(UIView *)arg2 atIndex:(long long)arg3;
- (void)paginatorViewDidBeginPaging:(SYPaginatorView *)arg1;
@end

