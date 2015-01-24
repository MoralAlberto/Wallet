//
//  AMMoney.h
//  Wallet
//
//  Created by Moral on 17/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

@import Foundation;
@class AMMoney;
@class AMBroker;

@protocol AMMoney <NSObject>

- (id)initWithAmount:(NSInteger)amount currency:(NSString *)currency;
//  times devuelve un objeto que implementa el protocolo AMMoney
- (id<AMMoney>)times:(NSInteger)multiplies;
- (id<AMMoney>)plus:(AMMoney *)other;

- (id<AMMoney>)reduceToCurrency:(NSString *)currency withBroker:(AMBroker *)broker;
@end

@interface AMMoney : NSObject <AMMoney>

@property (strong, nonatomic, readonly) NSNumber *amount;
@property (readonly, nonatomic) NSString *currency;

+ (id)euroWithAmount:(NSInteger)amount;
+ (id)dollarWithAmount:(NSInteger)amount;

@end
