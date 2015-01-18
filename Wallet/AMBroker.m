//
//  AMBroker.m
//  Wallet
//
//  Created by Moral on 18/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

#import "AMBroker.h"
#import "AMMoney.h"

@implementation AMBroker

- (AMMoney *)reduce:(AMMoney *)money toCurrency:(NSString *)currency {
    return money;
}

@end
