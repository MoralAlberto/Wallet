//
//  AMFakeNotificationCenter.m
//  Wallet
//
//  Created by Moral on 25/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

#import "AMFakeNotificationCenter.h"

@implementation AMFakeNotificationCenter

-(id)init{
    if (self = [super init]) {
        _observers = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject {

    [self.observers setObject:observer forKey:aName];
}

@end
