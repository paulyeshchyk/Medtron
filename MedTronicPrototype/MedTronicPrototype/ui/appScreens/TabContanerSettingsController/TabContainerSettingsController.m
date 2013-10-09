//
//  SettingsViewController.m
//  MedTronicPrototype
//
//  Created by Pavel on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "TabContainerSettingsController.h"
#import "ApplicationCommandsManager.h"
#import "SettingsViewController.h"

@interface TabContainerSettingsController (){
    IBOutlet SettingsViewController* settingsViewController_;
    IBOutlet UIView* settingsViewControllerContainer_;
}

@end

@implementation TabContainerSettingsController

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
    [settingsViewControllerContainer_ addSubview:settingsViewController_.view];
    [settingsViewController_.view setFrame:settingsViewControllerContainer_.bounds];
//    [settingsViewController_.view setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
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
@end
