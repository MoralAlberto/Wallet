//
//  AMDollar.h
//  Wallet
//
//  Created by Moral on 17/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

@import Foundation;
#import "AMMoney.h"

@interface AMDollar : AMMoney

- (instancetype)initWithAmount:(NSInteger)amount;
- (AMDollar *)times:(NSInteger)multiplier;

@end
