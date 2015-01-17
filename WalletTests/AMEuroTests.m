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
#import "AMMoney.h"

@interface AMEuroTests : XCTestCase
@end

@implementation AMEuroTests

//  Crear Test de multiplicación
- (void)testMultiplication {
    AMEuro *euro = [AMMoney euroWithAmount:5];
    AMEuro *ten = [AMMoney euroWithAmount:10];
    AMEuro *total = [euro times:2];

    //  Sabemos con toda seguridad que si ocultamos amount, la app sigue funcionando
    //  No ha roto nada
    XCTAssertEqualObjects(total, ten, @"€5 * 2 shoud be €10");
}

- (void)testEquality {
    AMEuro *five = [AMMoney euroWithAmount:5];
    AMEuro *ten = [AMMoney euroWithAmount:10];
    
    AMEuro *total = [five times:2];
    
    //  Creamos en la clase AMEuro la función isEqual
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal!");
}

- (void)testHash {

    AMEuro *a = [AMMoney euroWithAmount:2];
    AMEuro *b = [AMMoney euroWithAmount:2];
    
    //  Sabemos que estos dos son iguales xk hay un test que lo comprueba
    XCTAssertEqual([a hash], [b hash], @"Equal object must have same hash");
}

- (void)testAmountStorage {

    AMEuro *euro = [AMMoney euroWithAmount:2];
    
    //  Asegurarnos de que el valor en amount es 2
    //  En general no es una buena idea, pero siempre que necesitamos testar algo de
    //  dentro del objeto, es buena idea utilizarlo
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)] integerValue], @"The value retrieved should be the same as the stored");
#pragma clang diagnostic pop
    
}

@end
