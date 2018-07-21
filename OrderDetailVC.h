//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UIViewController.h"

@class CKList, JXOrderInfoModel, JXTableView;

@interface OrderDetailVC : UIViewController
{
    JXOrderInfoModel *_orderModel;
    JXTableView *_tableView;
    CKList *_datasource;
}

@property(retain, nonatomic) CKList *datasource; // @synthesize datasource=_datasource;
@property(nonatomic) __weak JXTableView *tableView; // @synthesize tableView=_tableView;
@property(retain, nonatomic) JXOrderInfoModel *orderModel; // @synthesize orderModel=_orderModel;
- (void).cxx_destruct;
- (void)tableView:(id)arg1 willDisplayCell:(id)arg2 forRowAtIndexPath:(id)arg3;
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2;
- (double)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2;
- (double)tableView:(id)arg1 heightForFooterInSection:(long long)arg2;
- (double)tableView:(id)arg1 heightForHeaderInSection:(long long)arg2;
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (long long)tableView:(id)arg1 numberOfRowsInSection:(long long)arg2;
- (long long)numberOfSectionsInTableView:(id)arg1;
- (id)createInfoCell:(id)arg1 andTitle:(id)arg2;
- (id)createTitleCell:(id)arg1;
- (void)setupDatasource;
- (void)setupUI;
- (void)didReceiveMemoryWarning;
- (void)viewDidLoad;

@end

