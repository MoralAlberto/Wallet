//
//  AMWalletTest.m
//  Wallet
//
//  Created by Moral on 24/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AMMoney.h"
#import "AMBroker.h"
#import "AMWallet.h"

@interface AMWalletTest : XCTestCase

@end

@implementation AMWalletTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// €40 + $20 = $100 2:1
- (void)testAdditionWithReduction {

    AMBroker *broker = [AMBroker new];
    //  2 euros son 2 dolares.
    [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    AMWallet *wallet = [[AMWallet alloc] initWithAmount:40 currency:@"EUR"];
    [wallet plus:[AMMoney dollarWithAmount:20]];
    
    AMMoney *reduced = [broker reduce:wallet toCurrency:@"USD"];
    
    XCTAssertEqualObjects(reduced, [AMMoney dollarWithAmount:100], @"€40 + $20 = $100 2:1.");
}

@end
