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

@end

@implementation AMBrokerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSimpleReduction {

    AMBroker *broker = [[AMBroker alloc] init];
    AMMoney *sum = [[AMMoney dollarWithAmount:5] plus:[AMMoney dollarWithAmount:5]];
    
    AMMoney *reduced = [broker reduce:sum toCurrency:@"USD"];
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");


}

@end
