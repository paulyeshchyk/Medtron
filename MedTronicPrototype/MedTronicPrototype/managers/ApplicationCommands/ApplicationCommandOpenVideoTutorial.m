//
//  ApplicationCommandOpenVideoTutorial.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "ApplicationCommandOpenVideoTutorial.h"
#import "MYMVideoTutorialViewController.h"

@implementation ApplicationCommandOpenVideoTutorial

- (NSInteger)executeWithArgs:(NSDictionary *)args {
    UINavigationController* navigationController = [args objectForKey:@"navigationController"];
    MYMVideoTutorialViewController* viewController = [[MYMVideoTutorialViewController alloc] initWithNibName:@"MYMVideoTutorialViewController" bundle:[NSBundle mainBundle]];
    viewController.title = @"Video Tutorials";
    [navigationController pushViewController:viewController animated:YES ];
    return 0;
}
@end
