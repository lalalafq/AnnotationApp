//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSObject.h"

@class NSMutableDictionary;

@interface HKTokenPool : NSObject
{
    NSMutableDictionary *_pool;
}

@property(retain, nonatomic) NSMutableDictionary *pool; // @synthesize pool=_pool;
- (void).cxx_destruct;
- (_Bool)isTokenAvailableForAccount:(id)arg1;
- (id)tokenForAccount:(id)arg1;
- (void)setToken:(id)arg1 forAccount:(id)arg2;
- (void)removeToken:(id)arg1 forAccount:(id)arg2;
- (id)init;

@end
