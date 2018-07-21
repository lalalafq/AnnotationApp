//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSObject.h"

#import "NSCopying.h"
#import "NSSecureCoding.h"

@class AFHTTPRequestSerializer<AFURLRequestSerialization>, AFHTTPResponseSerializer<AFURLResponseSerialization>, AFNetworkReachabilityManager, AFSecurityPolicy, NSObject<OS_dispatch_group>, NSObject<OS_dispatch_queue>, NSOperationQueue, NSURL, NSURLCredential;

@interface AFHTTPRequestOperationManager : NSObject <NSSecureCoding, NSCopying>
{
    _Bool _shouldUseCredentialStorage;
    NSURL *_baseURL;
    AFHTTPRequestSerializer<AFURLRequestSerialization> *_requestSerializer;
    AFHTTPResponseSerializer<AFURLResponseSerialization> *_responseSerializer;
    NSOperationQueue *_operationQueue;
    NSURLCredential *_credential;
    AFSecurityPolicy *_securityPolicy;
    AFNetworkReachabilityManager *_reachabilityManager;
    NSObject<OS_dispatch_queue> *_completionQueue;
    NSObject<OS_dispatch_group> *_completionGroup;
}

+ (_Bool)supportsSecureCoding;
+ (id)manager;
@property(retain, nonatomic) NSObject<OS_dispatch_group> *completionGroup; // @synthesize completionGroup=_completionGroup;
@property(retain, nonatomic) NSObject<OS_dispatch_queue> *completionQueue; // @synthesize completionQueue=_completionQueue;
@property(retain, nonatomic) AFNetworkReachabilityManager *reachabilityManager; // @synthesize reachabilityManager=_reachabilityManager;
@property(retain, nonatomic) AFSecurityPolicy *securityPolicy; // @synthesize securityPolicy=_securityPolicy;
@property(retain, nonatomic) NSURLCredential *credential; // @synthesize credential=_credential;
@property(nonatomic) _Bool shouldUseCredentialStorage; // @synthesize shouldUseCredentialStorage=_shouldUseCredentialStorage;
@property(retain, nonatomic) NSOperationQueue *operationQueue; // @synthesize operationQueue=_operationQueue;
@property(retain, nonatomic) AFHTTPResponseSerializer<AFURLResponseSerialization> *responseSerializer; // @synthesize responseSerializer=_responseSerializer;
@property(retain, nonatomic) AFHTTPRequestSerializer<AFURLRequestSerialization> *requestSerializer; // @synthesize requestSerializer=_requestSerializer;
@property(retain, nonatomic) NSURL *baseURL; // @synthesize baseURL=_baseURL;
- (void).cxx_destruct;
- (id)copyWithZone:(struct _NSZone *)arg1;
- (void)encodeWithCoder:(id)arg1;
- (id)initWithCoder:(id)arg1;
- (id)description;
- (id)DELETE:(id)arg1 parameters:(id)arg2 success:(CDUnknownBlockType)arg3 failure:(CDUnknownBlockType)arg4;
- (id)PATCH:(id)arg1 parameters:(id)arg2 success:(CDUnknownBlockType)arg3 failure:(CDUnknownBlockType)arg4;
- (id)PUT:(id)arg1 parameters:(id)arg2 success:(CDUnknownBlockType)arg3 failure:(CDUnknownBlockType)arg4;
- (id)POST:(id)arg1 parameters:(id)arg2 constructingBodyWithBlock:(CDUnknownBlockType)arg3 success:(CDUnknownBlockType)arg4 failure:(CDUnknownBlockType)arg5;
- (id)POST:(id)arg1 parameters:(id)arg2 success:(CDUnknownBlockType)arg3 failure:(CDUnknownBlockType)arg4;
- (id)HEAD:(id)arg1 parameters:(id)arg2 success:(CDUnknownBlockType)arg3 failure:(CDUnknownBlockType)arg4;
- (id)GET:(id)arg1 parameters:(id)arg2 success:(CDUnknownBlockType)arg3 failure:(CDUnknownBlockType)arg4;
- (id)HTTPRequestOperationWithRequest:(id)arg1 success:(CDUnknownBlockType)arg2 failure:(CDUnknownBlockType)arg3;
- (id)HTTPRequestOperationWithHTTPMethod:(id)arg1 URLString:(id)arg2 parameters:(id)arg3 success:(CDUnknownBlockType)arg4 failure:(CDUnknownBlockType)arg5;
- (id)initWithBaseURL:(id)arg1;
- (id)init;
- (id)unicodeToChinese:(id)arg1;
- (id)rac_invokeMethod:(id)arg1 parameters:(id)arg2;
- (id)requestWithMethod:(id)arg1 parameters:(id)arg2 requestId:(id)arg3;
- (id)rac_invokeMethod:(id)arg1 parameters:(id)arg2 requestId:(id)arg3 operation:(id *)arg4;
- (id)networkReachabilityStatusSignal;
- (id)rac_requestPath:(id)arg1 parameters:(id)arg2 method:(id)arg3;
- (id)rac_PATCH:(id)arg1 parameters:(id)arg2;
- (id)rac_DELETE:(id)arg1 parameters:(id)arg2;
- (id)rac_PUT:(id)arg1 parameters:(id)arg2;
- (id)rac_POST:(id)arg1 parameters:(id)arg2;
- (id)rac_GET:(id)arg1 parameters:(id)arg2;
- (id)rac_enqueueHTTPRequestOperation:(id)arg1;

@end

