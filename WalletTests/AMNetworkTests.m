//
//  AMNetworkTests.m
//  Wallet
//
//  Created by Moral on 25/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AMBroker.h"

@interface AMNetworkTests : XCTestCase

@end

@implementation AMNetworkTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//  No testas código de red nunca, se testa como responde tu código ante el
//  webservice. 
- (void)testThatEmptyRatesRaisesException {

    AMBroker *broker = [AMBroker new];
    NSData *jsonData = nil;
    
    XCTAssertThrows([broker parseJSONRates:jsonData], @"An empty json should raise an exception");
}

@end
