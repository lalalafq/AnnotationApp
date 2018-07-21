//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSObject.h"

#import "UITextFieldDelegate.h"

@class NSString, UIButton, UITextField;

@interface HKSMSModel : NSObject <UITextFieldDelegate>
{
    UIButton *_getVcodeButton;
    UITextField *_inputVcodeField;
    UITextField *_phoneField;
}

@property(retain, nonatomic) UITextField *phoneField; // @synthesize phoneField=_phoneField;
@property(retain, nonatomic) UITextField *inputVcodeField; // @synthesize inputVcodeField=_inputVcodeField;
@property(retain, nonatomic) UIButton *getVcodeButton; // @synthesize getVcodeButton=_getVcodeButton;
- (void).cxx_destruct;
- (id)rac_getTokenWithAccount:(id)arg1;
- (id)rac_timeCountDown:(double)arg1;
- (id)rac_startGetVcodeWithFetchVcodeSignal:(id)arg1;
- (_Bool)countDownIfNeededWithVcodeType:(long long)arg1;
- (id)rac_getBindVcodeByPhone:(id)arg1;
- (id)rac_getSystemVcodeWithType:(long long)arg1 phone:(id)arg2;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end

