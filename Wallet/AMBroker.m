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

@end

@implementation AMBroker

//  Sobreescribimos el init de NSObject
- (id)init {
    if (self = [super init]) {
        _rates = [@{} mutableCopy];
    }
    return self;
}

- (AMMoney *)reduce:(id<AMMoney>)money
         toCurrency:(NSString *)currency {
    
//  Double dispatch
    return [money reduceToCurrency:currency withBroker:self];
}


- (void)addRate:(NSInteger)rate
   fromCurrency:(NSString *)fromCurrency
     toCurrency:(NSString *)toCurrency{

    [self.rates setObject:@(rate) forKey:[self keyFromCurrency:fromCurrency toCurrency:toCurrency]];
    
    [self.rates setObject:@(1.0/rate) forKey:[self keyFromCurrency:toCurrency toCurrency:fromCurrency]];
}

#pragma mark - Utils

- (NSString *)keyFromCurrency:(NSString *)fromCurrency toCurrency:(NSString *)toCurrency {
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
}

#pragma mark - Network Test
//  Después de la conexión a la red
-(void)parseJSONRates:(NSData *)data {

    NSError *err = nil;
    id obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
    
    if (obj != nil) {
        //  Pillamos los rates y los vamos añadiendo al broker
    } else {
        //  No hemos recibido nada
        [NSException raise:@"NoRatesInJSONException" format:@"JSON must carry some data!"];
    }
}

@end
