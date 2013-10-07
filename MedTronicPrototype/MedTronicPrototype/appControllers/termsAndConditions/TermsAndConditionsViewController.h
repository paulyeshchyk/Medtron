//
//  TermsAndConditionsViewController.h
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CloseActionBlock)(id sender, BOOL accepted, BOOL wasFirstTime);

@interface TermsAndConditionsViewController : UIViewController
@property (nonatomic, copy)CloseActionBlock onCloseBlock;
+(void)navigationController:(UINavigationController*)navController askUserToAcceptText:(CloseActionBlock)block;
@end
