//
//  AMWalletTableViewController.h
//  Wallet
//
//  Created by Moral on 24/1/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AMWallet;

@interface AMWalletTableViewController : UITableViewController

- (id)initWithModel:(AMWallet *)wallet;

@end
