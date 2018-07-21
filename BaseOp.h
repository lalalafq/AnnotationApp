//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSObject.h"

#import "BaseOpDelegate.h"

@class AFHTTPRequestOperation, NSError, NSHTTPURLResponse, NSString, RACSignal;

@interface BaseOp : NSObject <BaseOpDelegate>
{
    _Bool _simulateResponse;
    _Bool _isNeedToken;
    _Bool _security;
    _Bool _rsp_hasNewMsg;
    unsigned int _req_id;
    unsigned int _req_vid;
    double _simulateResponseDelay;
    AFHTTPRequestOperation *_af_operation;
    NSString *_req_method;
    NSString *_token;
    NSString *_skey;
    NSString *_vkey;
    NSString *_sign;
    long long _rsp_statusCode;
    NSError *_rsp_error;
    long long _rsp_code;
    NSString *_rsp_prompt;
    RACSignal *_rac_curSignal;
    NSHTTPURLResponse *_response;
}

+ (void)cancelAllCurrentClassOpsInClient:(id)arg1;
+ (id)operation;
@property(retain, nonatomic) NSHTTPURLResponse *response; // @synthesize response=_response;
@property(nonatomic) __weak RACSignal *rac_curSignal; // @synthesize rac_curSignal=_rac_curSignal;
@property(nonatomic) _Bool rsp_hasNewMsg; // @synthesize rsp_hasNewMsg=_rsp_hasNewMsg;
@property(retain, nonatomic) NSString *rsp_prompt; // @synthesize rsp_prompt=_rsp_prompt;
@property(nonatomic) long long rsp_code; // @synthesize rsp_code=_rsp_code;
@property(nonatomic) NSError *rsp_error; // @synthesize rsp_error=_rsp_error;
@property(nonatomic) long long rsp_statusCode; // @synthesize rsp_statusCode=_rsp_statusCode;
@property(readonly, nonatomic) _Bool security; // @synthesize security=_security;
@property(copy, nonatomic) NSString *sign; // @synthesize sign=_sign;
@property(readonly, nonatomic) NSString *vkey; // @synthesize vkey=_vkey;
@property(copy, nonatomic) NSString *skey; // @synthesize skey=_skey;
@property(copy, nonatomic) NSString *token; // @synthesize token=_token;
@property(nonatomic) unsigned int req_vid; // @synthesize req_vid=_req_vid;
@property(nonatomic) unsigned int req_id; // @synthesize req_id=_req_id;
@property(retain, nonatomic) NSString *req_method; // @synthesize req_method=_req_method;
@property(nonatomic) _Bool isNeedToken; // @synthesize isNeedToken=_isNeedToken;
@property(nonatomic) __weak AFHTTPRequestOperation *af_operation; // @synthesize af_operation=_af_operation;
@property(nonatomic) double simulateResponseDelay; // @synthesize simulateResponseDelay=_simulateResponseDelay;
@property(nonatomic) _Bool simulateResponse; // @synthesize simulateResponse=_simulateResponse;
- (void).cxx_destruct;
- (id)parentObject:(id)arg1 addObject:(id)arg2 forKey:(id)arg3;
- (id)filterNSNullForParentObject:(id)arg1 addNewObject:(id)arg2 withKey:(id)arg3 fromOldObject:(id)arg4;
- (id)addSafetyToLength:(int)arg1;
- (id)safetyString:(id)arg1;
- (id)addSecurityParamsFrom:(id)arg1;
- (id)rac_simulateResponse;
- (id)parseDefaultResponseObject:(id)arg1;
- (void)cancel;
- (_Bool)shouldHandleDefaultError;
- (id)rac_invokeWithRPCClient:(id)arg1 params:(id)arg2 security:(_Bool)arg3;
- (void)increaseRequistIDs;
- (id)init;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end
