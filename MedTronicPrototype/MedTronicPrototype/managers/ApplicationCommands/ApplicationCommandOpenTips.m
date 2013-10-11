//
//  ApplicationCommandOpenTips.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "ApplicationCommandOpenTips.h"
#import "MYMTipsViewController.h"

@implementation ApplicationCommandOpenTips
- (NSInteger)executeWithArgs:(NSDictionary *)args {
    UINavigationController* navigationController = [args objectForKey:@"navigationController"];
    MYMTipsViewController* viewController = [[MYMTipsViewController alloc] initWithNibName:@"MYMTipsViewController" bundle:[NSBundle mainBundle]];
    viewController.title = @"Tips";
    [navigationController pushViewController:viewController animated:YES ];
    return 0;
}
@end
