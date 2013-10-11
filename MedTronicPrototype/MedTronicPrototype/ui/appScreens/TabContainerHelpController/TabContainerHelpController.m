//
//  HelpViewController.m
//  MedTronicPrototype
//
//  Created by Pavel on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "TabContainerHelpController.h"
#import "ApplicationCommandsManager.h"
#import "MYMPumpAndAlarmViewController.h"
#import "MYMTravelViewController.h"
#import "MYMExpandableViewController.h"

@interface TabContainerHelpController () <MYMExpandableViewControllerDelegate>
@property (nonatomic, strong) IBOutlet MYMExpandableViewController* expandableViewController;
@property (nonatomic, weak) IBOutlet UIView* travelSubView;
@end

@implementation TabContainerHelpController

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.expandableViewController.view];
    [self.expandableViewController setIsExpanded:NO];
    [self.expandableViewController.view setFrame:CGRectMake (100,300,200,200)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
- (IBAction)onBackButtonClicked:(id)sender {
    [[ApplicationCommandsManager sharedInstance] openTabHome:nil];
}

- (IBAction)onVideoTutorialsClicked:(id)sender {
    [[ApplicationCommandsManager sharedInstance] openVideoTutorial:@{@"navigationController": self.navigationController}];
}

- (IBAction)onChecklistClicked:(id)sender {
    [[ApplicationCommandsManager sharedInstance] openCheckList:@{@"navigationController": self.navigationController}];
}

- (IBAction)onTipsClicked:(id)sender {
    [[ApplicationCommandsManager sharedInstance] openTips:@{@"navigationController": self.navigationController}];
}

- (IBAction)onPumpAndAlarmsClicked:(id)sender {
    [[ApplicationCommandsManager sharedInstance] openPumpAndAlarms:@{@"navigationController": self.navigationController}];
}

- (IBAction)onTravelClicked:(id)sender {
    [[ApplicationCommandsManager sharedInstance] openTravel:@{@"navigationController": self.navigationController}];
}

#pragma mark - MYMExpandableViewControllerDelegate
- (UIView*)viewToExpand {
    return self.travelSubView;
}

@end
