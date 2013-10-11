//
//  ApplicationCommandOpenTravel.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "ApplicationCommandOpenTravel.h"
#import "MYMTravelViewController.h"

@implementation ApplicationCommandOpenTravel
- (NSInteger)executeWithArgs:(NSDictionary*)args {
    UINavigationController* navigationController = [args objectForKey:@"navigationController"];
    MYMTravelViewController* viewController = [[MYMTravelViewController alloc] initWithNibName:@"MYMTravelViewController" bundle:[NSBundle mainBundle]];
    [navigationController pushViewController:viewController animated:YES ];
    return 0;
}

@end
