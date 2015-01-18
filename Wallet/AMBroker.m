//
//  AMBroker.m
//  Wallet
//
//  Created by Moral on 18/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

#import "AMBroker.h"
#import "AMMoney.h"

@interface AMBroker ()

@property (strong, nonatomic) NSMutableDictionary *rates;

@end

@implementation AMBroker

//  Sobreescribimos el init de NSObject
- (id)init {
    if (self = [super init]) {
        _rates = [@{} mutableCopy];
    }
    return self;
}

- (AMMoney *)reduce:(AMMoney *)money
         toCurrency:(NSString *)currency {
    return money;
}

- (void)addRate:(NSInteger)rate
   fromCurrency:(NSString *)fromCurrency
     toCurrency:(NSString *)toCurrency{

    [self.rates setObject:@(rate) forKey:[self keyFromCurrency:fromCurrency toCurrency:toCurrency]];
}

#pragma mark - Utils

- (NSString *)keyFromCurrency:(NSString *)fromCurrency toCurrency:(NSString *)toCurrency {
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
}

@end
