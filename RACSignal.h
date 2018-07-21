//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "RACStream.h"

@class RACSequence;

@interface RACSignal : RACStream
{
}

+ (id)startLazilyWithScheduler:(id)arg1 block:(CDUnknownBlockType)arg2;
+ (id)startEagerlyWithScheduler:(id)arg1 block:(CDUnknownBlockType)arg2;
+ (id)never;
+ (id)error:(id)arg1;
+ (id)createSignal:(CDUnknownBlockType)arg1;
+ (id)defer:(CDUnknownBlockType)arg1;
+ (id)if:(id)arg1 then:(id)arg2 else:(id)arg3;
+ (id)switch:(id)arg1 cases:(id)arg2 default:(id)arg3;
+ (id)interval:(double)arg1 onScheduler:(id)arg2 withLeeway:(double)arg3;
+ (id)interval:(double)arg1 onScheduler:(id)arg2;
+ (id)merge:(id)arg1;
+ (id)combineLatest:(id)arg1 reduce:(CDUnknownBlockType)arg2;
+ (id)combineLatest:(id)arg1;
+ (id)interval:(double)arg1 withLeeway:(double)arg2;
+ (id)interval:(double)arg1;
+ (id)return:(id)arg1;
+ (id)empty;
+ (id)startWithScheduler:(id)arg1 block:(CDUnknownBlockType)arg2;
+ (id)start:(CDUnknownBlockType)arg1;
+ (id)startWithScheduler:(id)arg1 subjectBlock:(CDUnknownBlockType)arg2;
- (id)description;
- (id)subscribed;
- (id)subscribeNext:(CDUnknownBlockType)arg1 error:(CDUnknownBlockType)arg2 success:(CDUnknownBlockType)arg3;
- (id)subscribeNext:(CDUnknownBlockType)arg1 error:(CDUnknownBlockType)arg2 others:(CDUnknownBlockType)arg3;
- (id)doEmpty:(CDUnknownBlockType)arg1;
- (id)ignoreError;
- (id)takeUntilForCell:(id)arg1;
- (id)eventWithName:(id)arg1 object:(id)arg2 userInfo:(id)arg3;
- (id)eventWithName:(id)arg1 object:(id)arg2;
- (id)eventWithName:(id)arg1;
- (id)or;
- (id)and;
- (id)not;
- (id)dematerialize;
- (id)materialize;
- (id)ignoreValues;
- (id)sample:(id)arg1;
- (id)retry;
- (id)retry:(long long)arg1;
- (id)all:(CDUnknownBlockType)arg1;
- (id)any:(CDUnknownBlockType)arg1;
- (id)any;
- (id)groupBy:(CDUnknownBlockType)arg1;
- (id)groupBy:(CDUnknownBlockType)arg1 transform:(CDUnknownBlockType)arg2;
- (id)subscribeOn:(id)arg1;
- (id)deliverOn:(id)arg1;
- (id)timeout:(double)arg1 onScheduler:(id)arg2;
- (id)replayLazily;
- (id)replayLast;
- (id)replay;
- (id)multicast:(id)arg1;
- (id)publish;
@property(readonly, nonatomic) RACSequence *sequence;
- (id)toArray;
- (_Bool)waitUntilCompleted:(id *)arg1;
- (id)firstOrDefault:(id)arg1 success:(_Bool *)arg2 error:(id *)arg3;
- (id)firstOrDefault:(id)arg1;
- (id)first;
- (id)switchToLatest;
- (id)takeUntilReplacement:(id)arg1;
- (id)takeUntil:(id)arg1;
- (id)setKeyPath:(id)arg1 onObject:(id)arg2 nilValue:(id)arg3;
- (id)setKeyPath:(id)arg1 onObject:(id)arg2;
- (id)aggregateWithStart:(id)arg1 reduceWithIndex:(CDUnknownBlockType)arg2;
- (id)aggregateWithStart:(id)arg1 reduce:(CDUnknownBlockType)arg2;
- (id)aggregateWithStartFactory:(CDUnknownBlockType)arg1 reduce:(CDUnknownBlockType)arg2;
- (id)concat;
- (id)then:(CDUnknownBlockType)arg1;
- (id)flatten:(unsigned long long)arg1;
- (id)merge:(id)arg1;
- (id)combineLatestWith:(id)arg1;
- (id)takeLast:(unsigned long long)arg1;
- (id)collect;
- (id)bufferWithTime:(double)arg1 onScheduler:(id)arg2;
- (id)finally:(CDUnknownBlockType)arg1;
- (id)initially:(CDUnknownBlockType)arg1;
- (id)tryMap:(CDUnknownBlockType)arg1;
- (id)try:(CDUnknownBlockType)arg1;
- (id)catchTo:(id)arg1;
- (id)catch:(CDUnknownBlockType)arg1;
- (id)repeat;
- (id)delay:(double)arg1;
- (id)throttle:(double)arg1 valuesPassingTest:(CDUnknownBlockType)arg2;
- (id)throttle:(double)arg1;
- (id)doCompleted:(CDUnknownBlockType)arg1;
- (id)doError:(CDUnknownBlockType)arg1;
- (id)doNext:(CDUnknownBlockType)arg1;
- (id)executeCommand:(id)arg1;
- (id)aggregateWithStartFactory:(CDUnknownBlockType)arg1 combine:(CDUnknownBlockType)arg2;
- (id)aggregateWithStart:(id)arg1 combine:(CDUnknownBlockType)arg2;
- (id)sequenceNext:(CDUnknownBlockType)arg1;
- (id)ignoreElements;
- (id)toProperty:(id)arg1 onObject:(id)arg2;
- (id)bufferWithTime:(double)arg1;
- (id)timeout:(double)arg1;
- (id)let:(CDUnknownBlockType)arg1;
- (id)buffer:(unsigned long long)arg1;
- (id)windowWithStart:(id)arg1 close:(CDUnknownBlockType)arg2;
- (id)zipWith:(id)arg1;
- (id)concat:(id)arg1;
- (id)bind:(CDUnknownBlockType)arg1;
- (id)subscribeError:(CDUnknownBlockType)arg1 completed:(CDUnknownBlockType)arg2;
- (id)subscribeNext:(CDUnknownBlockType)arg1 error:(CDUnknownBlockType)arg2;
- (id)subscribeCompleted:(CDUnknownBlockType)arg1;
- (id)subscribeError:(CDUnknownBlockType)arg1;
- (id)subscribeNext:(CDUnknownBlockType)arg1 error:(CDUnknownBlockType)arg2 completed:(CDUnknownBlockType)arg3;
- (id)subscribeNext:(CDUnknownBlockType)arg1 completed:(CDUnknownBlockType)arg2;
- (id)subscribeNext:(CDUnknownBlockType)arg1;
- (id)subscribe:(id)arg1;
- (id)logCompleted;
- (id)logError;
- (id)logNext;
- (id)logAll;
- (_Bool)asynchronouslyWaitUntilCompleted:(id *)arg1;
- (id)asynchronousFirstOrDefault:(id)arg1 success:(_Bool *)arg2 error:(id *)arg3;

@end

