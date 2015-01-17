//
//  AMMoneyTest.m
//  Wallet
//
//  Created by Moral on 17/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

@import UIKit;
@import XCTest;
#import "AMMoney.h"

@interface AMMoneyTest : XCTestCase

@end

@implementation AMMoneyTest

//- (void)testThatTimesRaisesException {
//    
//    //  Pasa el test xk se lanza una excepción.
//    AMMoney *money = [[AMMoney alloc] initWithAmount:1];
//    XCTAssertThrows([money times:2], @"Should raise an expcetion.");
//    
//}

- (void)testCurrencies {

    XCTAssertEqualObjects(@"EUR", [[AMMoney euroWithAmount:1] currency], @"The currency of euros should be EUR");
    XCTAssertEqualObjects(@"USD", [[AMMoney dollarWithAmount:1] currency], @"The currency of dollars should be USD");
}

@end
