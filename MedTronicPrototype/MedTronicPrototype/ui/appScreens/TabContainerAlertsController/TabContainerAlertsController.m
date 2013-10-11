//
//  AlertsViewController.m
//  MedTronicPrototype
//
//  Created by Pavel on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "TabContainerAlertsController.h"
#import "ApplicationCommandsManager.h"

@interface TabContainerAlertsController (){
}
@end

@implementation TabContainerAlertsController

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


- (IBAction)onAlertsButtonClicked:(id)sender {
    [[ApplicationCommandsManager sharedInstance] openAlertsSettings:@{@"navigationController": self.navigationController}];
}

- (IBAction)onPumpButtonClicked:(id)sender {
    [[ApplicationCommandsManager sharedInstance] openPumpSettings:@{@"navigationController": self.navigationController}];
}

@end
