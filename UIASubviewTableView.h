//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UITableView.h"

#import "UITableViewDataSource.h"
#import "UITableViewDelegate.h"

@class NSString;

@interface UIASubviewTableView : UITableView <UITableViewDataSource, UITableViewDelegate>
{
    id _dataSourceImpl;
    id _delegateMediator;
    struct {
        unsigned int subviewSourceViewHeightForRow:1;
    } _subviewTableViewFlags;
    id <UIASubviewTableSubviewSource> _subviewSource;
}

@property(nonatomic) __weak id <UIASubviewTableSubviewSource> subviewSource; // @synthesize subviewSource=_subviewSource;
- (void).cxx_destruct;
- (double)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2;
- (void)setDelegate:(id)arg1;
- (void)setDataSource:(id)arg1;
- (id)dataSource;
- (id)initWithFrame:(struct CGRect)arg1 style:(long long)arg2;
- (id)initWithCoder:(id)arg1;
- (void)_subviewTableViewInit;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end
