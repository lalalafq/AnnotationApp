//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UITabBarItem.h"

#import "UI7Patch.h"

@class NSString;

@interface UI7TabBarItem : UITabBarItem <UI7Patch>
{
}

+ (void)patch;
+ (void)initialize;
- (id)_updateImageWithTintColor:(id)arg1 isSelected:(_Bool)arg2 getImageOffset:(struct UIOffset *)arg3;
- (id)initWithCoder:(id)arg1;
- (id)initWithTabBarSystemItem:(long long)arg1 tag:(long long)arg2;
- (id)initWithTitle:(id)arg1 image:(id)arg2 tag:(long long)arg3;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end
