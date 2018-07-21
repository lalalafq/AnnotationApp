//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSObject.h"

#import "UIADimmingViewDelegate.h"

@class NSString, UIADimmingView, UIView, UIViewController;

@interface UIAResultDisplayController : NSObject <UIADimmingViewDelegate>
{
    UIViewController *_contentsController;
    UIADimmingView *_dimmingView;
    UIView *_resultView;
    id <UIAResultDisplayDelegate> _delegate;
    struct {
        unsigned int visible:1;
        unsigned int animating:1;
        unsigned int hidNavigationBar:1;
        unsigned int navigationBarHidingEnabled:1;
        unsigned int resultViewLoaded:1;
        unsigned int delegateWillShowSearchResultView:1;
        unsigned int delegateDidShowSearchResultView:1;
        unsigned int delegateWillHideSearchResultView:1;
        unsigned int delegateDidHideSearchResultView:1;
        unsigned int delegateShouldShowDimmingView:1;
        unsigned int delegateShouldReloadResultView:1;
        unsigned int delegateReloadResultView:1;
    } _resultDisplayControllerFlags;
    UIView *inputView;
}

@property(nonatomic) __weak UIView *inputView; // @synthesize inputView;
@property(readonly, nonatomic) UIViewController *contentsController; // @synthesize contentsController=_contentsController;
- (void).cxx_destruct;
- (void)dimmingViewDidCancel:(id)arg1;
@property(retain, nonatomic) UIView *resultView;
- (void)setActive:(_Bool)arg1 animated:(_Bool)arg2;
@property(nonatomic, getter=isActive) _Bool active;
@property(retain, nonatomic) UIADimmingView *dimmingView;
- (void)reloadResult;
- (void)_loadResult:(_Bool)arg1;
- (void)loadResultView;
@property(nonatomic) __weak id <UIAResultDisplayDelegate> delegate;
- (void)dealloc;
- (id)initWithContentsController:(id)arg1;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end
