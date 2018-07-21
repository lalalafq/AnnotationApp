//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UIImageView.h"

#import "UIGestureRecognizerDelegate.h"

@class NSString, SDWaitingView, UIScrollView;

@interface SDBrowserImageView : UIImageView <UIGestureRecognizerDelegate>
{
    SDWaitingView *_waitingView;
    _Bool _didCheckSize;
    UIScrollView *_scroll;
    UIImageView *_scrollImageView;
    UIScrollView *_zoomingScroolView;
    UIImageView *_zoomingImageView;
    double _totalScale;
    _Bool _hasLoadedImage;
    double _progress;
}

@property(nonatomic) _Bool hasLoadedImage; // @synthesize hasLoadedImage=_hasLoadedImage;
@property(nonatomic) double progress; // @synthesize progress=_progress;
- (void).cxx_destruct;
- (void)removeWaitingView;
- (void)clear;
- (void)eliminateScale;
- (void)scaleImage:(double)arg1;
- (void)prepareForImageViewScaling;
- (void)doubleTapToZommWithScale:(double)arg1;
- (void)zoomWithScale:(double)arg1;
- (void)setTotalScale:(double)arg1;
- (void)zoomImage:(id)arg1;
- (void)setImageWithURL:(id)arg1 placeholderImage:(id)arg2;
- (void)layoutSubviews;
@property(readonly, nonatomic) _Bool isScaled;
- (id)initWithFrame:(struct CGRect)arg1;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end

