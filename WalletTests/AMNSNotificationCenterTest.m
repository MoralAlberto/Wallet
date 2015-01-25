//
//  AMNSNotificationCenterTest.m
//  Wallet
//
//  Created by Moral on 25/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AMFakeNotificationCenter.h"
#import "AMWallet.h"

@interface AMNSNotificationCenterTest : XCTestCase

@end

@implementation AMNSNotificationCenterTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//  Comprobar que cierto objeto se da de alta cuando le envias un cierto mensaje al inicializarse.
- (void)testThatSubscribesToMemoryWarning {

    AMFakeNotificationCenter *fake = [AMFakeNotificationCenter new];
    AMWallet *w = [AMWallet new];
    
    [w subscribeToMemoryWarning:(NSNotificationCenter *)fake];
    
    NSDictionary *obs = [fake observers];
    id observer = [obs objectForKey:UIApplicationDidReceiveMemoryWarningNotification];
    
    XCTAssertEqualObjects(observer, w, @"Fat object must subscribe to UIApplicationDidReceiveMemoryWarningNotification");
    //  Comprobar que realmente se ha dado de alta en la notificación de aviso de memoria
    
    
}


@end
