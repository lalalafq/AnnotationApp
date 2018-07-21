//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSObject.h"

@class NSMutableDictionary, NSString;

@interface CKTreeNode : NSObject
{
    CKTreeNode *_parentNode;
    NSMutableDictionary *_childNodeDict;
    NSString *_key;
    id _object;
}

+ (id)nodeWithKey:(id)arg1;
@property(retain, nonatomic) id object; // @synthesize object=_object;
@property(readonly, nonatomic) NSString *key; // @synthesize key=_key;
@property(retain, nonatomic) NSMutableDictionary *childNodeDict; // @synthesize childNodeDict=_childNodeDict;
@property(readonly, nonatomic) __weak CKTreeNode *parentNode; // @synthesize parentNode=_parentNode;
- (void).cxx_destruct;
- (void)removeFromParentNode;
- (void)removeAllChildNodes;
- (void)removeChildNodeForKey:(id)arg1;
- (id)childNodeForKey:(id)arg1;
- (id)allChildNodes;
- (void)addChildNode:(id)arg1;
- (id)initWithKey:(id)arg1;

@end

