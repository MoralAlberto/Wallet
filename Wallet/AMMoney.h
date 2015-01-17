//
//  AMMoney.h
//  Wallet
//
//  Created by Moral on 17/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

@import Foundation;

@interface AMMoney : NSObject

- (id)initWithAmount:(NSInteger)amount;
- (AMMoney *)times:(NSInteger)multiplies;

@end
