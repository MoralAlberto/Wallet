//
//  AMBrokerTest.m
//  Wallet
//
//  Created by Moral on 18/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

@import XCTest;
#import "AMMoney.h"
#import "AMBroker.h"

@interface AMBrokerTest : XCTestCase
@property (nonatomic, strong) AMBroker *emptyBroker;
@property (nonatomic, strong) AMMoney *oneDollar;
@end

@implementation AMBrokerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.emptyBroker = [AMBroker new];
    self.oneDollar = [AMMoney dollarWithAmount:1];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.emptyBroker = nil;
    self.oneDollar = nil;
}

- (void)testSimpleReduction {

    AMMoney *sum = [[AMMoney dollarWithAmount:5] plus:[AMMoney dollarWithAmount:5]];
    
    AMMoney *reduced = [self.emptyBroker reduce:sum toCurrency:@"USD"];
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");
}

//  $10 == €5 2:1
- (void)testReduction {

    [self.emptyBroker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    AMMoney *dollars = [AMMoney dollarWithAmount:10];
    AMMoney *euros = [AMMoney euroWithAmount:5];

    AMMoney *converted = [self.emptyBroker reduce:dollars toCurrency:@"EUR"];
    
    XCTAssertEqualObjects(converted, euros, @"$10 == €5 2:1");
}

- (void)testThatNoRateRaisesException {

    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar toCurrency:@"EUR"], @"No rates should cause exception.");

}

- (void)testThatNilConversionDoesNotChangeMoney {

    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduce:self.oneDollar toCurrency:@"USD"], @"A nil conversion should have no effect.");
}


@end
