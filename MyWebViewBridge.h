//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSObject.h"

@class UIViewController, WebViewJavascriptBridge;

@interface MyWebViewBridge : NSObject
{
    WebViewJavascriptBridge *_myBridge;
    UIViewController *_targetVC;
}

@property(nonatomic) __weak UIViewController *targetVC; // @synthesize targetVC=_targetVC;
@property(retain, nonatomic) WebViewJavascriptBridge *myBridge; // @synthesize myBridge=_myBridge;
- (void).cxx_destruct;
- (id)initBridgeWithWebView:(id)arg1 andDelegate:(id)arg2 withTargetVC:(id)arg3;
- (void)dealloc;

@end

