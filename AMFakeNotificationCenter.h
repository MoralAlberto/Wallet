//
//  AMFakeNotificationCenter.h
//  Wallet
//
//  Created by Moral on 25/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMFakeNotificationCenter : NSObject

@property (nonatomic, strong) NSMutableDictionary *observers;

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject;
@end
