//
//  AMWallet.m
//  Wallet
//
//  Created by Moral on 24/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

@import UIKit;
#import "AMWallet.h"
#import "AMMoney.h"

@interface AMWallet() 
@property (nonatomic, strong) NSMutableArray *moneys;
@end

@implementation AMWallet

- (NSUInteger)count {
    return self.moneys.count + 1;
}

-(id)initWithAmount:(NSInteger)amount currency:(NSString *)currency {

    if (self = [super init]) {
        AMMoney *money = [[AMMoney alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
    }
    return self;
}

-(id<AMMoney>)plus:(AMMoney *)other {
    [self.moneys addObject:other];
    return self;
}

-(id<AMMoney>)times:(NSInteger)multiplies {

    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    
    for (AMMoney *each in self.moneys) {
        AMMoney *newMoney = [each times:multiplies];
        [newMoneys addObject:newMoney];
    }
    
    self.moneys = newMoneys;
    return self;
}

-(id<AMMoney>)reduceToCurrency:(NSString *)currency withBroker:(AMBroker *)broker {

    AMMoney *result = [[AMMoney alloc] initWithAmount:0 currency:currency];
    
    for (AMMoney *each in self.moneys) {
        result = [result plus:[each reduceToCurrency:currency withBroker:broker]];
    }

    return result;
}

#pragma mark - Notifications
- (void)subscribeToMemoryWarning:(NSNotificationCenter *)nc {

    [nc addObserver:self selector:@selector(dumpToDisk:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];

}
     
- (void)dumpToDisk:(NSNotificationCenter *)nc {

}

@end
