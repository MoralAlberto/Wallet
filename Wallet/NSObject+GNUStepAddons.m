//
//  NSObject+GNUStepAddons.m
//  Wallet
//
//  Created by Moral on 17/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

#import "NSObject+GNUStepAddons.h"
//  Si utilizamos el runtime de objective-C debemos importar
//  No es demsiado común importar esta clase
#import <objc/runtime.h>

@implementation NSObject (GNUStepAddons)

//  Recibimos el selector, que es un número que representa/identifica al nombre de un mensaje (nombre del método), lo que recive como parámetro es una referencia al mensaje
- (id)subclassResponsability:(SEL)aSel {
    //  Nos devuelve la clase de un objeto, en objective las clases y las intancias ambos son objetos y si es un objeto tiene su clase, y la clase de su clase es la metaclase. Si tu envias el mensaje class a una clase (no te devuelve su metaclase) te envia ella misma, necesitamos que en el caso de que sea una clase te devuelva su metaclase.
    char prefix = class_isMetaClass(object_getClass(self)) ? '+': '-';
    
    [NSException raise:NSInvalidArgumentException format:@"%@%c%@", NSStringFromClass([self class]), prefix, NSStringFromSelector(aSel)];
    return self;
}

@end
