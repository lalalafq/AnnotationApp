//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSObject.h"

@interface NSObject (Notify)
- (void)cancelListenNotificationByName:(id)arg1;
- (void)cancelAllListenedNotifications;
- (void)postCustomNotificationName:(id)arg1 object:(id)arg2 userInfo:(id)arg3;
- (void)postCustomNotificationName:(id)arg1 object:(id)arg2;
- (void)postCustomNotification:(id)arg1;
- (_Bool)isListenedNotificationByName:(id)arg1;
- (void)listenNotificationByName:(id)arg1 withNotifyBlock:(CDUnknownBlockType)arg2;
@end
