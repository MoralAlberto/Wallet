//
//  AMBroker.h
//  Wallet
//
//  Created by Moral on 18/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AMMoney;

@interface AMBroker : NSObject

- (AMMoney *)reduce:(AMMoney *)money toCurrency:(NSString *)currency;
@end
