//
//  ApplicationCommandOpenCheckList.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "ApplicationCommandOpenCheckList.h"
#import "MYMCheckListViewController.h"

@implementation ApplicationCommandOpenCheckList

- (NSInteger)executeWithArgs:(NSDictionary*)args {
    UINavigationController* navigationController = [args objectForKey:@"navigationController"];
    MYMCheckListViewController* viewController = [[MYMCheckListViewController alloc] initWithNibName:@"MYMCheckListViewController" bundle:[NSBundle mainBundle]];
    viewController.title = @"Checklist";
    [navigationController pushViewController:viewController animated:YES ];
    return 0;
}

@end
