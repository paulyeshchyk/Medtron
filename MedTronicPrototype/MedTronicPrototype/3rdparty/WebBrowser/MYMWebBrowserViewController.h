//
//  MYMTipsExplanationViewController.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/12/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMViewController.h"

typedef void(^OnTipExplanationCloseBlock)(id sender);

@interface MYMWebBrowserViewController : MYMViewController
@property (nonatomic, copy)OnTipExplanationCloseBlock closeBlock;
@property (nonatomic, strong)NSString* text;
@property (nonatomic, strong)NSString* urlString;
@property (nonatomic, assign)BOOL useDynamicTitle;
@property (nonatomic, weak)UIViewController* toolBarOwner;
@end
