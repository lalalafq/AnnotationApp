//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UIViewController.h"

@class HKSMSModel, LoginViewModel, UIButton, UITextField;

@interface PhoneBindViewController : UIViewController
{
    LoginViewModel *_model;
    CDUnknownBlockType _loginSuccessAction;
    UITextField *_phoneTextField;
    UITextField *_vcodeTextField;
    UIButton *_getVcodeBtn;
    UIButton *_bindBtn;
    HKSMSModel *_smsModel;
}

@property(retain, nonatomic) HKSMSModel *smsModel; // @synthesize smsModel=_smsModel;
@property(nonatomic) __weak UIButton *bindBtn; // @synthesize bindBtn=_bindBtn;
@property(nonatomic) __weak UIButton *getVcodeBtn; // @synthesize getVcodeBtn=_getVcodeBtn;
@property(nonatomic) __weak UITextField *vcodeTextField; // @synthesize vcodeTextField=_vcodeTextField;
@property(nonatomic) __weak UITextField *phoneTextField; // @synthesize phoneTextField=_phoneTextField;
@property(copy, nonatomic) CDUnknownBlockType loginSuccessAction; // @synthesize loginSuccessAction=_loginSuccessAction;
@property(retain, nonatomic) LoginViewModel *model; // @synthesize model=_model;
- (void).cxx_destruct;
- (void)actionBind;
- (void)actionGetVcode;
- (void)actionCancel;
- (void)setupUI;
- (void)didReceiveMemoryWarning;
- (void)viewDidLoad;

@end
