//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UIStepper.h"

#import "UI7Patch.h"

@class NSString;

@interface UI7Stepper : UIStepper <UI7Patch>
{
}

+ (void)patch;
+ (void)initialize;
- (void)setTintColor:(id)arg1;
- (id)tintColor;
- (id)initWithFrame:(struct CGRect)arg1;
- (id)init;
- (void)awakeFromNib;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end

