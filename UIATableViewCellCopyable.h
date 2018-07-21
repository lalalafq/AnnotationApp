//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UITableViewCell.h"

@interface UIATableViewCellCopyable : UITableViewCell
{
    id <UIATableViewCellCopyableDelegate> _delegate;
    struct {
        unsigned int hasDelegateSelectionStyle:1;
        unsigned int hasDelegateString:1;
        unsigned int hasDelegateWillShowMenu:1;
        unsigned int hasDelegateWillHideMenu:1;
    } _copyableFlags;
}

@property(nonatomic) __weak id <UIATableViewCellCopyableDelegate> delegate; // @synthesize delegate=_delegate;
- (void).cxx_destruct;
- (void)handleLongPress:(id)arg1;
- (void)menuWillShow:(id)arg1;
- (void)menuWillHide:(id)arg1;
- (void)touchesEnded:(id)arg1 withEvent:(id)arg2;
- (_Bool)becomeFirstResponder;
- (_Bool)canBecomeFirstResponder;
- (void)copy:(id)arg1;
- (_Bool)canPerformAction:(SEL)arg1 withSender:(id)arg2;
- (id)initWithStyle:(long long)arg1 reuseIdentifier:(id)arg2;
- (void)initAsUIATableViewCellCopyable;

@end
