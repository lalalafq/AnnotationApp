//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSObject.h"

#import "SYPaginatorViewDataSource.h"
#import "SYPaginatorViewDelegate.h"

@class NSArray, NSString, UIView, UIViewController;

@interface ADViewController : NSObject <SYPaginatorViewDelegate, SYPaginatorViewDataSource>
{
    UIView *_adView;
    NSArray *_adList;
    UIViewController *_targetVC;
}

@property(readonly, nonatomic) __weak UIViewController *targetVC; // @synthesize targetVC=_targetVC;
@property(readonly, nonatomic) NSArray *adList; // @synthesize adList=_adList;
@property(readonly, nonatomic) UIView *adView; // @synthesize adView=_adView;
- (void).cxx_destruct;
- (id)paginatorView:(id)arg1 viewForPageAtIndex:(long long)arg2;
- (long long)numberOfPagesForPaginatorView:(id)arg1;
- (id)rac_fetchBannerSignal;
- (id)rac_getBannerSignal;
- (void)reloadDataWithForce:(_Bool)arg1 completed:(CDUnknownBlockType)arg2;
- (id)initWithBoundsWidth:(double)arg1 targetVC:(id)arg2;
- (void)dealloc;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end

