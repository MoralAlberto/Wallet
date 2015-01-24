//
//  AMMoney.m
//  Wallet
//
//  Created by Moral on 17/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

#import "AMMoney.h"
#import "NSObject+GNUStepAddons.h"
#import "AMBroker.h"


@implementation AMMoney

+ (id)euroWithAmount:(NSInteger)amount {
    return [[AMMoney alloc] initWithAmount:amount currency:@"EUR"];
}

+ (id)dollarWithAmount:(NSInteger)amount {
    return [[AMMoney alloc] initWithAmount:amount currency:@"USD"];
}

- (id)initWithAmount:(NSInteger)amount currency:(NSString *)currency {

    if (self = [super init]) {
        _amount = @(amount);
        _currency = currency;
    }
    return self;
}

- (id<AMMoney>)times:(NSInteger)multiplier {
    //  No se debería llamar sino que se debería usar el de la subclase
    //  Jamás se debería llamar este método
    //  _cmd es un parámetro oculto que recive cada mensaje, que identifica ese método
    //return [self subclassResponsability:_cmd];
    AMMoney *newMoney = [[AMMoney alloc] initWithAmount:[self.amount integerValue] * multiplier currency:self.currency];
    return newMoney;
}

- (id<AMMoney>)plus:(AMMoney *)other {
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    AMMoney *total = [[AMMoney alloc] initWithAmount:totalAmount currency:self.currency];
    return total;
}

-(AMMoney *)reduceToCurrency:(NSString *)currency withBroker:(AMBroker *)broker {

    AMMoney *result;
    double rate = [[broker.rates objectForKey:[broker keyFromCurrency:self.currency toCurrency:currency]] doubleValue];
    //  Comprobamos que divisa de origen y de destino son las mismas.
    if ([self.currency isEqual:currency]) {
        result = self;
    } else if (rate == 0) {
        //  No hay tasa de conversión, excepción que te crió
        [NSException raise:@"NoConversionRateException" format:@"Must have a conversion from %@ to %@", self.currency, currency];
    } else {
        //  Hay conversión
        double rate = [[broker.rates objectForKey:[broker keyFromCurrency:self.currency toCurrency:currency]] doubleValue];
        
        NSInteger newAmount = [self.amount integerValue] * rate;
        
        result = [[AMMoney alloc] initWithAmount:newAmount currency:currency];
    }
    
    return result;
    
}

#pragma mark - Overwritten
- (NSString *) description {
    return [NSString stringWithFormat:@"<%@: %@ %@>",
            [self class], self.currency, self.amount];
}

#pragma mark - Overwritten

- (BOOL)isEqual:(id)object {
    //  Cual es el código que pase este test? comparar la cantidad.
    if ([self.currency isEqual:[object currency]]) {
        return [self amount] == [object amount];
    } else {
        return NO;
    }
}

//  El método hash nos dice si dos objetos son iguales, NSObject lo que hace es devolver
//  la dirección de memoria para saber si dos objetos son el mismo.
- (NSUInteger)hash {
    return  [self.amount integerValue];
}

@end
