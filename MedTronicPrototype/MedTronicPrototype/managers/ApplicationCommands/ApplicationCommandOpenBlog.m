//
//  ApplicationCommandOpenBlog.m
//  MedTronicPrototype
//
//  Created by Pavel on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "ApplicationCommandOpenBlog.h"
#import "HomeViewController.h"

@implementation ApplicationCommandOpenBlog

- (NSInteger)executeWithArgs:(NSDictionary*)args {
    HomeViewController* homeViewController = (HomeViewController*)[(UINavigationController*)[[[UIApplication sharedApplication] keyWindow] rootViewController] topViewController];
    [homeViewController openTabBlog:args];
    return 0;
}

@end
