//
//  InitialPathViewController.h
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/8/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^InitialPathControllerCloseActionBlock)(id sender);
@interface InitialPathViewController : UIViewController
@property (nonatomic, copy)InitialPathControllerCloseActionBlock onCloseBlock;
+(void)newInstanceInsideNavigationController:(UINavigationController*)navController pushWithCloseBlock:(InitialPathControllerCloseActionBlock)block;
@end
