//
//  AMEuro.m
//  Wallet
//
//  Created by Moral on 15/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

#import "AMEuro.h"
@interface AMEuro ()
@property (nonatomic) NSInteger amount;
@end

@implementation AMEuro

- (instancetype)initWithAmount:(NSInteger)amount {
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
}

- (AMEuro *)times:(NSInteger)multiplier {
    AMEuro *newEuro = [[AMEuro alloc] initWithAmount:self.amount * multiplier];
    return newEuro;
}

#pragma mark - Overwritten

- (BOOL)isEqual:(id)object {
    //  Cual es el código que pase este test? comparar la cantidad.
    return [self amount] == [object amount];
}

@end
