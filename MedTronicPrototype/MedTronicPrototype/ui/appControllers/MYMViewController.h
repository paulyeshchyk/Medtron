//
//  UIViewControllerWithContext.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/5/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYMViewController : UIViewController
@property (nonatomic, strong)NSDictionary* args;
- (void)saveChanges:(NSError**)error;
- (void)rollbackChanges;
@end
