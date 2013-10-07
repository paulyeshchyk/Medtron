//
//  ApplicationCommandOpenActionsTab.m
//  MedTronicPrototype
//
//  Created by Pavel on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "ApplicationCommandOpenActionsTab.h"
#import "HomeViewController.h"

@implementation ApplicationCommandOpenActionsTab

- (NSInteger)executeWithArgs:(NSDictionary*)args {
    HomeViewController* homeViewController = (HomeViewController*)[(UINavigationController*)[[[UIApplication sharedApplication] keyWindow] rootViewController] topViewController];
    [homeViewController openTabActions:args];
    return 0;
}

@end
