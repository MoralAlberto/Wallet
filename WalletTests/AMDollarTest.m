//
//  AMDollarTest.m
//  Wallet
//
//  Created by Moral on 17/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

@import UIKit;
@import XCTest;
#import "AMDollar.h"

@interface AMDollarTest : XCTestCase

@end

@implementation AMDollarTest


- (void)testMultiplication {
    
    AMDollar *five = [[AMDollar alloc] initWithAmount:5];
    AMDollar *ten = [[AMDollar alloc] initWithAmount:10];
    AMDollar *total = [five times:2];
    
    XCTAssertEqualObjects(total, ten, @"$5 * 2 should be $10");
}

//  Añadimos test de igualda
- (void)testEquality {
    AMDollar *five = [[AMDollar alloc] initWithAmount:5];
    AMDollar *total = [five times:2];
    
    AMDollar *ten = [[AMDollar alloc] initWithAmount:10];
    
    XCTAssertEqualObjects(total, ten, @"Equivalent objects should be equal");
    XCTAssertFalse([total isEqual:five], @"Non equivalent objects shouldnot be equal");
}


@end
