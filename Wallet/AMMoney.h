//
//  AMMoney.h
//  Wallet
//
//  Created by Moral on 17/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

@import Foundation;

@interface AMMoney : NSObject

@property (readonly, nonatomic) NSString *currency;

+ (id)euroWithAmount:(NSInteger)amount;
+ (id)dollarWithAmount:(NSInteger)amount;
- (id)initWithAmount:(NSInteger)amount currency:(NSString *)currency;
- (id)times:(NSInteger)multiplies;

@end
