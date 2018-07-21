//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UIViewController.h"

#import "NJKWebViewProgressDelegate.h"
#import "UIWebViewDelegate.h"

@class MyWebViewBridge, NJKWebViewProgress, NJKWebViewProgressView, NSLayoutConstraint, NSString, NSURLRequest, UIButton, UIImage, UIView, UIWebView;

@interface JXWebViewController : UIViewController <NJKWebViewProgressDelegate, UIWebViewDelegate>
{
    _Bool _isShowBottomView;
    NSString *_urlStr;
    NSString *_thumbnailUrl;
    NSString *_tt;
    NSString *_subTitle;
    UIImage *_image;
    NJKWebViewProgress *_progressProxy;
    NJKWebViewProgressView *_progressView;
    NSLayoutConstraint *_webViewBottomConstraint;
    UIButton *_collectionBtn;
    UIButton *_shareBtn;
    NSLayoutConstraint *_bottomViewHeightConstraint;
    UIView *_bottomView;
    MyWebViewBridge *_bridge;
    UIWebView *_jxWebView;
    NSURLRequest *_request;
}

@property(retain, nonatomic) NSURLRequest *request; // @synthesize request=_request;
@property(nonatomic) __weak UIWebView *jxWebView; // @synthesize jxWebView=_jxWebView;
@property(retain, nonatomic) MyWebViewBridge *bridge; // @synthesize bridge=_bridge;
@property(nonatomic) __weak UIView *bottomView; // @synthesize bottomView=_bottomView;
@property(nonatomic) __weak NSLayoutConstraint *bottomViewHeightConstraint; // @synthesize bottomViewHeightConstraint=_bottomViewHeightConstraint;
@property(nonatomic) __weak UIButton *shareBtn; // @synthesize shareBtn=_shareBtn;
@property(nonatomic) __weak UIButton *collectionBtn; // @synthesize collectionBtn=_collectionBtn;
@property(nonatomic) __weak NSLayoutConstraint *webViewBottomConstraint; // @synthesize webViewBottomConstraint=_webViewBottomConstraint;
@property(retain, nonatomic) NJKWebViewProgressView *progressView; // @synthesize progressView=_progressView;
@property(retain, nonatomic) NJKWebViewProgress *progressProxy; // @synthesize progressProxy=_progressProxy;
@property(nonatomic) _Bool isShowBottomView; // @synthesize isShowBottomView=_isShowBottomView;
@property(retain, nonatomic) UIImage *image; // @synthesize image=_image;
@property(copy, nonatomic) NSString *subTitle; // @synthesize subTitle=_subTitle;
@property(copy, nonatomic) NSString *tt; // @synthesize tt=_tt;
@property(copy, nonatomic) NSString *thumbnailUrl; // @synthesize thumbnailUrl=_thumbnailUrl;
@property(copy, nonatomic) NSString *urlStr; // @synthesize urlStr=_urlStr;
- (void).cxx_destruct;
- (void)webViewDidFinishLoad:(id)arg1;
- (void)webViewDidStartLoad:(id)arg1;
- (_Bool)webView:(id)arg1 shouldStartLoadWithRequest:(id)arg2 navigationType:(long long)arg3;
- (void)webView:(id)arg1 didFailLoadWithError:(id)arg2;
- (void)webViewProgress:(id)arg1 updateProgress:(float)arg2;
- (void)setupBridge;
- (id)getSuitableImage:(id)arg1;
- (void)changeUserAgent;
- (void)handleSendResult:(int)arg1;
- (void)shareQQ;
- (void)shareToWeChat:(long long)arg1 withTitle:(id)arg2 andDescription:(id)arg3 andImage:(id)arg4 andUrl:(id)arg5;
- (void)getImageShareToWeChat:(long long)arg1;
- (void)shareTimeline;
- (void)shareWechat;
- (void)actionShare;
- (void)actionCollection;
- (void)setupUI;
- (void)setupProcessView;
- (void)didReceiveMemoryWarning;
- (void)viewWillDisappear:(_Bool)arg1;
- (void)viewWillAppear:(_Bool)arg1;
- (void)viewDidLoad;
- (void)awakeFromNib;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end

