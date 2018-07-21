//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UIViewController.h"

@class NSString, UIButton, UITextField;

@interface EditInfoViewController : UIViewController
{
    unsigned long long _editType;
    NSString *_editInfo;
    UITextField *_infoTextField;
    UIButton *_saveBtn;
}

@property(nonatomic) __weak UIButton *saveBtn; // @synthesize saveBtn=_saveBtn;
@property(nonatomic) __weak UITextField *infoTextField; // @synthesize infoTextField=_infoTextField;
@property(copy, nonatomic) NSString *editInfo; // @synthesize editInfo=_editInfo;
@property(nonatomic) unsigned long long editType; // @synthesize editType=_editType;
- (void).cxx_destruct;
- (void)actionSave;
- (void)setupUI;
- (void)didReceiveMemoryWarning;
- (void)viewDidLoad;

@end

