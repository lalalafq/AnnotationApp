//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UIControl.h"

@class UIColor, UIImage, UIImageView, UIView;

@interface SevenSwitch : UIControl
{
    UIView *background;
    UIView *knob;
    UIImageView *onImageView;
    UIImageView *offImageView;
    _Bool currentVisualValue;
    _Bool startTrackingValue;
    _Bool didChangeWhileTracking;
    _Bool isAnimating;
    _Bool isRounded;
    _Bool on;
    UIColor *inactiveColor;
    UIColor *activeColor;
    UIColor *onTintColor;
    UIColor *borderColor;
    UIColor *thumbTintColor;
    UIColor *shadowColor;
    UIImage *onImage;
    UIImage *offImage;
}

+ (_Bool)isSubclassOfClass:(Class)arg1;
@property(nonatomic) _Bool on; // @synthesize on;
@property(nonatomic) _Bool isRounded; // @synthesize isRounded;
@property(retain, nonatomic) UIImage *offImage; // @synthesize offImage;
@property(retain, nonatomic) UIImage *onImage; // @synthesize onImage;
@property(retain, nonatomic) UIColor *shadowColor; // @synthesize shadowColor;
@property(retain, nonatomic) UIColor *thumbTintColor; // @synthesize thumbTintColor;
@property(retain, nonatomic) UIColor *borderColor; // @synthesize borderColor;
@property(retain, nonatomic) UIColor *onTintColor; // @synthesize onTintColor;
@property(retain, nonatomic) UIColor *activeColor; // @synthesize activeColor;
@property(retain, nonatomic) UIColor *inactiveColor; // @synthesize inactiveColor;
- (void).cxx_destruct;
@property(retain, nonatomic) UIColor *knobColor;
@property(retain, nonatomic) UIColor *onColor;
- (void)showOff:(_Bool)arg1;
- (void)showOn:(_Bool)arg1;
- (_Bool)isOn;
- (void)setOn:(_Bool)arg1 animated:(_Bool)arg2;
- (void)layoutSubviews;
- (void)cancelTrackingWithEvent:(id)arg1;
- (void)endTrackingWithTouch:(id)arg1 withEvent:(id)arg2;
- (_Bool)continueTrackingWithTouch:(id)arg1 withEvent:(id)arg2;
- (_Bool)beginTrackingWithTouch:(id)arg1 withEvent:(id)arg2;
- (void)setup;
- (id)initWithFrame:(struct CGRect)arg1;
- (id)initWithCoder:(id)arg1;
- (id)init;
- (void)setFrame:(struct CGRect)arg1;
- (struct CGSize)intrinsicContentSize;
- (_Bool)isKindOfClass:(Class)arg1;

@end

