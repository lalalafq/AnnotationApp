//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UIViewController.h"

#import "SPPageMenuDelegate.h"
#import "UIScrollViewDelegate.h"
#import "UISearchBarDelegate.h"

@class ADViewController, NSArray, NSString, SPPageMenu, UIScrollView, UISearchBar;

@interface HomePageVC : UIViewController <SPPageMenuDelegate, UIScrollViewDelegate, UISearchBarDelegate>
{
    UISearchBar *_searchBar;
    UIScrollView *_scrollView;
    ADViewController *_adctrl;
    SPPageMenu *_newsMenuView;
    UIScrollView *_newsScrollView;
    NSArray *_newsViewControllers;
    NSArray *_newsTypeArray;
}

@property(retain, nonatomic) NSArray *newsTypeArray; // @synthesize newsTypeArray=_newsTypeArray;
@property(retain, nonatomic) NSArray *newsViewControllers; // @synthesize newsViewControllers=_newsViewControllers;
@property(retain, nonatomic) UIScrollView *newsScrollView; // @synthesize newsScrollView=_newsScrollView;
@property(retain, nonatomic) SPPageMenu *newsMenuView; // @synthesize newsMenuView=_newsMenuView;
@property(retain, nonatomic) ADViewController *adctrl; // @synthesize adctrl=_adctrl;
@property(retain, nonatomic) UIScrollView *scrollView; // @synthesize scrollView=_scrollView;
@property(retain, nonatomic) UISearchBar *searchBar; // @synthesize searchBar=_searchBar;
- (void).cxx_destruct;
- (void)pageMenu:(id)arg1 itemSelectedFromIndex:(long long)arg2 toIndex:(long long)arg3;
- (void)pageMenu:(id)arg1 itemSelectedAtIndex:(long long)arg2;
- (void)jumpToSearchVC;
- (void)fetchUserInfo;
- (void)autoLogin;
- (void)handleGetNewsTypeInfo:(id)arg1;
- (void)refreshHomePage;
- (void)setupNewsScrollView;
- (void)setupNewsMenuView;
- (void)setupBannerViewInContainer;
- (void)setupScrollView;
- (void)setupUI;
- (void)didReceiveMemoryWarning;
- (void)viewWillDisappear:(_Bool)arg1;
- (void)viewWillAppear:(_Bool)arg1;
- (void)viewDidLoad;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end
