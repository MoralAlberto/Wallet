//
//  AMMoney.m
//  Wallet
//
//  Created by Moral on 17/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

#import "AMMoney.h"

@interface AMMoney ()

@property (nonatomic) NSInteger *amount;

@end

@implementation AMMoney

- (id)initWithAmount:(NSInteger)amount {

    if (self = [super init]) {
        _amount = _amount;
    }
    return self;
}

- (AMMoney *)times:(NSInteger)multiplies {
    //  No se debería llamar sino que se debería usar el de la subclase
    //  Jamás se debería llamar este método
    return self;
}

@end
