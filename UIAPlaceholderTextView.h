//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UITextView.h"

@class NSString, UIColor;

@interface UIAPlaceholderTextView : UITextView
{
    UITextView *_placeholderTextView;
    NSString *_placeholderString;
    _Bool _placeholderAnimated;
    _Bool _editing;
}

@property(nonatomic, getter=isPlaceholderAnimated) _Bool placeholderAnimated; // @synthesize placeholderAnimated=_placeholderAnimated;
- (void).cxx_destruct;
@property(readonly, nonatomic) __weak UITextView *placeholderTextView;
@property(retain, nonatomic) UIColor *placeholderColor;
@property(copy, nonatomic) NSString *placeholderString;
- (void)setFont:(id)arg1;
- (void)setText:(id)arg1;
- (void)setFrame:(struct CGRect)arg1;
- (void)dealloc;
- (id)initWithFrame:(struct CGRect)arg1;
- (id)initWithCoder:(id)arg1;
- (void)UIAPlaceholderTextViewInit;
- (void)_didEndEditing;
- (void)_textDidChanged;
- (void)_didBeginEditing;

@end

