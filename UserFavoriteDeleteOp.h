//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "BaseOp.h"

@class NSString;

@interface UserFavoriteDeleteOp : BaseOp
{
    NSString *_req_fids;
}

@property(copy, nonatomic) NSString *req_fids; // @synthesize req_fids=_req_fids;
- (void).cxx_destruct;
- (id)rac_postRequest;

@end
