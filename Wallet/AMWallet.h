//
//  AMWallet.h
//  Wallet
//
//  Created by Moral on 24/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMMoney.h"

@interface AMWallet : NSObject

-(id)initWithAmount:(NSInteger)amount currency:(NSString *)currency;
-(id<AMMoney>)plus:(AMMoney *)other;

@end
