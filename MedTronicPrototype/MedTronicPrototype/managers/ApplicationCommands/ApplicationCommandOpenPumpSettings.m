//
//  ApplicationCommandOpenPumpSettings.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "ApplicationCommandOpenPumpSettings.h"
#import "MYMPumpSettingsViewController.h"

@implementation ApplicationCommandOpenPumpSettings
- (NSInteger)executeWithArgs:(NSDictionary *)args {
    UINavigationController* navigationController = [args objectForKey:@"navigationController"];
    MYMPumpSettingsViewController* viewController = [[MYMPumpSettingsViewController alloc] initWithNibName:@"MYMPumpSettingsViewController" bundle:[NSBundle mainBundle]];
    viewController.title = @"Pump Settings";
    [navigationController pushViewController:viewController animated:YES];
    return 0;
}

@end
