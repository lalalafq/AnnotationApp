//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UISlider.h"

#import "UI7Patch.h"

@class NSString;

@interface UI7Slider : UISlider <UI7Patch>
{
}

+ (void)patch;
+ (void)initialize;
- (void)setMaximumTrackTintColor:(id)arg1;
- (id)maximumTrackTintColor;
- (void)setMinimumTrackTintColor:(id)arg1;
- (id)minimumTrackTintColor;
- (id)initWithCoder:(id)arg1;
- (id)initWithFrame:(struct CGRect)arg1;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end
