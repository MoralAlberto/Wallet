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


//  Crear Test de multiplicación
- (void)testMultiplication {
    AMMoney *euro = [AMMoney euroWithAmount:5];
    AMMoney *ten = [AMMoney euroWithAmount:10];
    AMMoney *total = [euro times:2];
    
    //  Sabemos con toda seguridad que si ocultamos amount, la app sigue funcionando
    //  No ha roto nada
    XCTAssertEqualObjects(total, ten, @"€5 * 2 shoud be €10");
}

- (void)testEquality {
    AMMoney *five = [AMMoney euroWithAmount:5];
    AMMoney *ten = [AMMoney euroWithAmount:10];
    
    AMMoney *total = [five times:2];
    
    //  Creamos en la clase AMEuro la función isEqual
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal!");
    //	Comprobar todos los subtipos de la clase
    XCTAssertEqualObjects([AMMoney dollarWithAmount:4], [[AMMoney dollarWithAmount:2] times:2],  @"Equivalent objects should be equal!");
}

- (void)testDifferentCurrencies {
    
    AMMoney *euro = [AMMoney euroWithAmount:1];
    AMMoney *dollar = [AMMoney dollarWithAmount:1];
    
    XCTAssertNotEqualObjects(euro, dollar, @"Different currencies should not be equal");
}

- (void)testHash {
    
    AMMoney *a = [AMMoney euroWithAmount:2];
    AMMoney *b = [AMMoney euroWithAmount:2];
    
    //  Sabemos que estos dos son iguales xk hay un test que lo comprueba
    XCTAssertEqual([a hash], [b hash], @"Equal object must have same hash");
    XCTAssertEqual([[AMMoney dollarWithAmount:2] hash], [[AMMoney dollarWithAmount:2] hash], @"Equal object must have same hash");
}

- (void)testAmountStorage {
    
    AMMoney *euro = [AMMoney euroWithAmount:2];
    
    //  Asegurarnos de que el valor en amount es 2
    //  En general no es una buena idea, pero siempre que necesitamos testar algo de
    //  dentro del objeto, es buena idea utilizarlo
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)] integerValue], @"The value retrieved should be the same as the stored");
    XCTAssertEqual(2, [[[AMMoney dollarWithAmount:2] performSelector:@selector(amount)] integerValue], @"The value retrieved should be the same as the stored");
#pragma clang diagnostic pop
    
}

- (void)testSimpleAddition {

    XCTAssertEqualObjects([[AMMoney dollarWithAmount:5] plus:[AMMoney dollarWithAmount:5]], [AMMoney dollarWithAmount:10], @"$5 + $5 = 10");
}

- (void)testThatHashIsAmount {

    AMMoney *one = [AMMoney dollarWithAmount:1];
    XCTAssertEqual([one hash], 1, @"The hash must be the same as the amount");
}

- (void)testDescription {

    AMMoney *one = [AMMoney dollarWithAmount:1];
    NSString *desc = @"<AMMoney: USD 1>";
    
    XCTAssertEqualObjects(desc, [one description], @"Description must macth template");
}


@end
