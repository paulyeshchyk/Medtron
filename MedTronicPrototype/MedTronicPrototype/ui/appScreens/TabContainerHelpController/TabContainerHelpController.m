//
//  HelpViewController.m
//  MedTronicPrototype
//
//  Created by Pavel on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "TabContainerHelpController.h"
#import "ApplicationCommandsManager.h"
#import "MYMVideoTutorialViewController.h"
#import "MYMPumpAndAlarmViewController.h"
#import "MYMTravelViewController.h"

@interface TabContainerHelpController ()

@end

@implementation TabContainerHelpController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
- (IBAction)onBackButtonClicked:(id)sender {
    [[ApplicationCommandsManager sharedInstance] openTabHome:nil];
}

- (IBAction)onVideoTutorialsClicked:(id)sender {
    MYMVideoTutorialViewController* viewController = [[MYMVideoTutorialViewController alloc] initWithNibName:@"MYMVideoTutorialViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:viewController animated:YES ];
}

- (IBAction)onPumpAndAlarmsClicked:(id)sender {
    MYMPumpAndAlarmViewController* viewController = [[MYMPumpAndAlarmViewController alloc] initWithNibName:@"MYMPumpAndAlarmViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:viewController animated:YES ];
}

- (IBAction)onTravelClicked:(id)sender {
    MYMTravelViewController* viewController = [[MYMTravelViewController alloc] initWithNibName:@"MYMTravelViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:viewController animated:YES ];
}

@end
