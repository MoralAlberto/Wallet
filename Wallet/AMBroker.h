//
//  AMBroker.h
//  Wallet
//
//  Created by Moral on 18/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMMoney.h"

@interface AMBroker : NSObject

@property (strong, nonatomic) NSMutableDictionary *rates;

- (AMMoney *)reduce:(id<AMMoney>)money toCurrency:(NSString *)currency;
- (void)addRate:(NSInteger)rate fromCurrency:(NSString *)fromCurrency toCurrency:(NSString *)toCurrency;
- (NSString *)keyFromCurrency:(NSString *)fromCurrency toCurrency:(NSString *)toCurrency;
-(void)parseJSONRates:(NSData *)data;
@end
