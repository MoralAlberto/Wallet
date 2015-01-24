//
//  AMSimpleViewController.m
//  Wallet
//
//  Created by Moral on 24/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

#import "AMSimpleViewController.h"

@implementation AMSimpleViewController


- (IBAction)displayText:(id)sender {
    //  Hacer que el código sea independiente de los ficheros de configuración.
    //  El xib es uno de ellos, ya que configura la vista para que la muestre
    //  tal y como la hemos creado en el .xib o storyboard
    UIButton *btn = sender;
    self.displayLabel.text = btn.titleLabel.text;
}
@end
