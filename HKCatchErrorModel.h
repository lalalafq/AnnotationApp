//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSObject.h"

@class UIAlertView;

@interface HKCatchErrorModel : NSObject
{
    UIAlertView *_alertView;
}

@property(nonatomic) __weak UIAlertView *alertView; // @synthesize alertView=_alertView;
- (void).cxx_destruct;
- (void)gotoRootViewWithAlertTitle:(id)arg1 msg:(id)arg2;
- (void)clearAllOperations;
- (void)catchNetworkingError;

@end
