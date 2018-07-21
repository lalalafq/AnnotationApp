//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UI7Button.h"

@class NSNumber;

@interface UI7BorderedRoundedRectButton : UI7Button
{
    NSNumber *_cornerRadius;
    NSNumber *_borderWidth;
}

@property(copy, nonatomic) NSNumber *borderWidth; // @synthesize borderWidth=_borderWidth;
@property(copy, nonatomic) NSNumber *cornerRadius; // @synthesize cornerRadius=_cornerRadius;
- (void)tintColorDidChange;
- (void)setTintColor:(id)arg1;
- (id)initWithFrame:(struct CGRect)arg1;
- (id)initWithCoder:(id)arg1;
- (void)_tintColorUpdated;
- (void)_roundedRectButtonInit;

@end
