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
    
    AMDollar *five = [AMMoney dollarWithAmount:5];
    AMDollar *ten = [AMMoney dollarWithAmount:10];
    AMDollar *total = [five times:2];
    
    XCTAssertEqualObjects(total, ten, @"$5 * 2 should be $10");
}

//  Añadimos test de igualda
- (void)testEquality {
    AMDollar *five = [AMMoney dollarWithAmount:5];
    AMDollar *total = [five times:2];
    
    AMDollar *ten = [AMMoney dollarWithAmount:10];
    
    XCTAssertEqualObjects(total, ten, @"Equivalent objects should be equal");
    XCTAssertFalse([total isEqual:five], @"Non equivalent objects shouldnot be equal");
}

- (void)testHash {
    
    AMDollar *a = [AMMoney dollarWithAmount:2];
    AMDollar *b = [AMMoney dollarWithAmount:2];
    
    //  Sabemos que estos dos son iguales xk hay un test que lo comprueba
    XCTAssertEqual([a hash], [b hash], @"Equal object must have same hash");
}


- (void)testAmountStorage {
    
    AMDollar *dollar = [AMMoney dollarWithAmount:2];
    
    //  Asegurarnos de que el valor en amount es 2
    //  En general no es una buena idea, pero siempre que necesitamos testar algo de
    //  dentro del objeto, es buena idea utilizarlo
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[dollar performSelector:@selector(amount)] integerValue], @"The value retrieved should be the same as the stored");
#pragma clang diagnostic pop
    
}

@end
