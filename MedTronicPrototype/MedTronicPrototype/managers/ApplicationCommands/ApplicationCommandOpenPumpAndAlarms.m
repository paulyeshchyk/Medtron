//
//  ApplicationCommandOpenPumpAndAlarms.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "ApplicationCommandOpenPumpAndAlarms.h"
#import "MYMPumpAndAlarmViewController.h"

@implementation ApplicationCommandOpenPumpAndAlarms
- (NSInteger)executeWithArgs:(NSDictionary *)args {
    UINavigationController* navigationController = [args objectForKey:@"navigationController"];
    MYMPumpAndAlarmViewController* viewController = [[MYMPumpAndAlarmViewController alloc] initWithNibName:@"MYMPumpAndAlarmViewController" bundle:[NSBundle mainBundle]];
    viewController.title = @"PUMP and Sensor Alarms";
    [navigationController pushViewController:viewController animated:YES ];
    return 0;
}
@end
