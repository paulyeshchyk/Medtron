//
//  MYMTipsExplanationViewController.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/12/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMViewController.h"

typedef void(^OnTipExplanationCloseBlock)(id sender);

@interface MYMTipsExplanationViewController : MYMViewController
@property (nonatomic, copy)OnTipExplanationCloseBlock closeBlock;
@property (nonatomic, strong)NSString* text;
@property (nonatomic, strong)NSString* urlString;
@end
