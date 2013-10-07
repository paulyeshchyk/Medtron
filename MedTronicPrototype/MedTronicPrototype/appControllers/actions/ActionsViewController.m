//
//  ActionsViewController.m
//  MedTronicPrototype
//
//  Created by Pavel on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "ActionsViewController.h"
#import "ApplicationCommandsManager.h"

@interface ActionsViewController () {
    IBOutlet UIButton* buttonCommandActions_;
    IBOutlet UIButton* buttonCommandMyOrder_;
    IBOutlet UIButton* buttonCommandHelp_;
    IBOutlet UIButton* buttonCommandSettings_;
    IBOutlet UILabel* blogsHeadline_;
}
@end

@implementation ActionsViewController

+(ActionsViewController*)newInstance {
    ActionsViewController* result = [[ActionsViewController alloc] initWithNibName:@"ActionsViewController" bundle:[NSBundle mainBundle]];
    return result;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ActionsViewConrollerProtocol
- (void)reloadActionSheet {
    blogsHeadline_.text = [self.datasource blogsHeadline];
}

#pragma mark -
- (IBAction)onButtonCommandActionsClicked:(id)sender {
    [[ApplicationCommandsManager sharedInstance] openTabActions:nil];
}

- (IBAction)onButtonCommandMyOrderClicked:(id)sender {
    [[ApplicationCommandsManager sharedInstance] openTabMyOrder:nil];
}

- (IBAction)onButtonCommandHelpClicked:(id)sender {
    [[ApplicationCommandsManager sharedInstance] openTabHelp:nil];
}

- (IBAction)onButtonCommandSettingsClicked:(id)sender {
    [[ApplicationCommandsManager sharedInstance] openTabSettings:nil];
}

@end
