//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "BaseOp.h"

@class NSString;

@interface VcodeBindOp : BaseOp
{
    NSString *_req_phone;
    NSString *_req_token;
}

@property(retain, nonatomic) NSString *req_token; // @synthesize req_token=_req_token;
@property(retain, nonatomic) NSString *req_phone; // @synthesize req_phone=_req_phone;
- (void).cxx_destruct;
- (id)parseResponseObject:(id)arg1;
- (id)rac_postRequest;

@end
