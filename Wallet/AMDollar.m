//
//  AMDollar.m
//  Wallet
//
//  Created by Moral on 17/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

#import "AMDollar.h"

@interface AMDollar ()
@property (nonatomic) NSInteger amount;
@end

@implementation AMDollar

- (instancetype)initWithAmount:(NSInteger)amount {
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
}

- (AMDollar *)times:(NSInteger)multiplier {
    AMDollar *newEuro = [[AMDollar alloc] initWithAmount:self.amount * multiplier];
    return newEuro;
}

#pragma mark - Overwritten

- (BOOL)isEqual:(id)object {
    //  Cual es el código que pase este test? comparar la cantidad.
    return [self amount] == [object amount];
}

@end
