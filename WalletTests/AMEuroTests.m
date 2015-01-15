//
//  AMEuroTests.m
//  Wallet
//
//  Created by Moral on 15/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

@import UIKit;
@import XCTest;
#import "AMEuro.h"

@interface AMEuroTests : XCTestCase
@end

@implementation AMEuroTests

//  Crear Test de multiplicación
- (void)testMultiplication {
    
    AMEuro *euro = [[AMEuro alloc] initWithAmount:5];
    AMEuro *total = [euro times:2];
    XCTAssertEqual(total.amount, 10, @"5*2 should be 10");

}

- (void)testEquality {
    AMEuro *five = [[AMEuro alloc] initWithAmount:5];
    AMEuro *ten = [[AMEuro alloc] initWithAmount:10];
    
    AMEuro *total = [five times:2];
    
    //  Creamos en la clase AMEuro la función isEqual
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal!");
}

@end
