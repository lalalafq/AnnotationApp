//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSEnumerator.h"

@interface _NSAFunctionalMapWithIndexEnumerator : NSEnumerator
{
    NSEnumerator *_enumerator;
    CDUnknownBlockType _mapper;
}

- (void).cxx_destruct;
- (unsigned long long)countByEnumeratingWithState:(CDStruct_70511ce9 *)arg1 objects:(id *)arg2 count:(unsigned long long)arg3;
- (id)initWithEnumerator:(id)arg1 mapper:(CDUnknownBlockType)arg2;

@end

