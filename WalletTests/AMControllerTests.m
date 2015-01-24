//
//  AMControllerTests.m
//  Wallet
//
//  Created by Moral on 24/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AMSimpleViewController.h"
#import "AMWalletTableViewController.h"
#import "AMWallet.h"

@interface AMControllerTests : XCTestCase
//  Simple View Controller
@property (nonatomic, strong) AMSimpleViewController *simpleVC;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;
//  Wallet Table View Controller
@property (nonatomic, strong) AMWalletTableViewController *walletVC;
@property (nonatomic, strong) AMWallet *wallet;
@end

@implementation AMControllerTests

- (void)setUp {
    [super setUp];
    //  Creamos el entorno de laboratiorio
    self.simpleVC = [[AMSimpleViewController alloc] initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;
    
    self.wallet = [[AMWallet alloc] initWithAmount:1 currency:@"USD"];
    [self.wallet plus:[AMMoney euroWithAmount:1]];
    self.walletVC = [[AMWalletTableViewController alloc] initWithModel: self.wallet];
}

- (void)tearDown {
    [super tearDown];
    //  Lo destruimos
    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
}

//  test ViewController
- (void)testThatTextOnLabelIsEqualToTextOnButton {

    //  mandamos el mensaje
    [self.simpleVC displayText:self.button];
    
    //  y comprobamos que la etiqueta y botón tienen el mismo texto
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text);
}


//  test TableViewController
- (void)testThatTableHasOneSection {
    //  Cuantas secciones te gustaría meter en una tabla
    //  Ténica muy habitual, el hacerse pasar por una cosa,
    //  Da mucho trabajo crear una tabla, y simulamos que nos devuelve
    //  El valor que tendría en caso de pasarle una tabla
    NSInteger sections = [self.walletVC numberOfSectionsInTableView:nil];

    XCTAssertEqual(sections, 1 , @"There can only be one.");
}

- (void)testThatNumberOfCellIsNumberOfMoneyPlusOne {

    XCTAssertEqual(self.wallet.count + 1, [self.walletVC tableView:nil numberOfRowsInSection:0], @"Number of cells is the number of moneys plus 1 (the total)");

}

@end
