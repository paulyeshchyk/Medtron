//
//  ApplicationCommandOpenAlertsSettings.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "ApplicationCommandOpenAlertsSettings.h"
#import "MYMAlertsSettingsViewController.h"

@implementation ApplicationCommandOpenAlertsSettings
- (NSInteger)executeWithArgs:(NSDictionary *)args {
    UINavigationController* navigationController = [args objectForKey:@"navigationController"];
    MYMAlertsSettingsViewController* viewController = [[MYMAlertsSettingsViewController alloc] initWithNibName:@"MYMAlertsSettingsViewController" bundle:[NSBundle mainBundle]];
    viewController.title = @"Alerts  Settings";
    [navigationController pushViewController:viewController animated:YES ];
    return 0;
}

@end
