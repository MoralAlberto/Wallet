//
//  AMEuro.h
//  Wallet
//
//  Created by Moral on 15/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

@import Foundation;

@interface AMEuro : NSObject

@property (nonatomic, readonly) NSInteger amount;
- (instancetype)initWithAmount:(NSInteger)amount;
- (AMEuro *)times:(NSInteger)multiplier;

@end
