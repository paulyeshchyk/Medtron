//
//  ApplicationCommandOpenHelpTab.m
//  MedTronicPrototype
//
//  Created by Pavel on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "ApplicationCommandOpenHelpTab.h"
#import "HomeViewController.h"

@implementation ApplicationCommandOpenHelpTab

- (NSInteger)executeWithArgs:(NSDictionary*)args {
    HomeViewController* homeViewController = (HomeViewController*)[(UINavigationController*)[[[UIApplication sharedApplication] keyWindow] rootViewController] topViewController];
    [homeViewController openTabHelp:args];
    return 0;
}

@end
