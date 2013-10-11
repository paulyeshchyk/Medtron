//
//  ApplicationCommandsManager.m
//  MedTronicPrototype
//
//  Created by Pavel on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "ApplicationCommandsManager.h"
#import "ApplicationCommandOpenHomeTab.h"
#import "ApplicationCommandOpenActionsTab.h"
#import "ApplicationCommandOpenMyOrderTab.h"
#import "ApplicationCommandOpenHelpTab.h"
#import "ApplicationCommandOpenSettingsTab.h"
#import "ApplicationCommandOpenBlog.h"
#import "ApplicationCommandOpenTravel.h"
#import "ApplicationCommandOpenCheckList.h"
#import "ApplicationCommandOpenVideoTutorial.h"
#import "ApplicationCommandOpenPumpAndAlarms.h"
#import "ApplicationCommandOpenTips.h"
#import "ApplicationCommandOpenPumpSettings.h"
#import "ApplicationCommandOpenAlertsSettings.h"

@implementation ApplicationCommandsManager
static ApplicationCommandsManager *sharedInstance_ = nil;

+ (ApplicationCommandsManager*)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance_ = [[self alloc] init];
    });
    return sharedInstance_;
}

- (void)openBlog:(NSDictionary*)args {
    [[ApplicationCommandOpenBlog new] executeWithArgs:args];
}

- (void)openTabHome:(NSDictionary*)args  {
    [[ApplicationCommandOpenHomeTab new] executeWithArgs:args];
}

- (void)openTabActions:(NSDictionary*)args  {
    [[ApplicationCommandOpenActionsTab new] executeWithArgs:args];
}

- (void)openTabMyOrder:(NSDictionary*)args  {
    [[ApplicationCommandOpenMyOrderTab new] executeWithArgs:args];
}

- (void)openTabHelp:(NSDictionary*)args  {
    [[ApplicationCommandOpenHelpTab new] executeWithArgs:args];
}

- (void)openTabSettings:(NSDictionary*)args  {
    [[ApplicationCommandOpenSettingsTab new] executeWithArgs:args];
}

- (void)shareBlog:(NSDictionary*)args {
    NSValue* rectValue = [args objectForKey:@"rect"];
    UIActionSheet* sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:nil destructiveButtonTitle:@"Cancel" otherButtonTitles:nil];
    [sheet showFromRect:[rectValue CGRectValue] inView:[args objectForKey:@"view"] animated:YES];
}

- (void)openTravel:(NSDictionary*)args  {
    [[ApplicationCommandOpenTravel new] executeWithArgs:args];
}

- (void)openTips:(NSDictionary*)args {
    [[ApplicationCommandOpenTips new] executeWithArgs:args];
}

- (void)openCheckList:(NSDictionary*)args {
    [[ApplicationCommandOpenCheckList new] executeWithArgs:args];
}

- (void)openVideoTutorial:(NSDictionary*)args {
    [[ApplicationCommandOpenVideoTutorial new] executeWithArgs:args];
}

- (void)openPumpAndAlarms:(NSDictionary*)args {
    [[ApplicationCommandOpenPumpAndAlarms new] executeWithArgs:args];
}

- (void)openPumpSettings:(NSDictionary*)args {
    [[ApplicationCommandOpenPumpSettings new] executeWithArgs:args];
}

- (void)openAlertsSettings:(NSDictionary*)args {
    [[ApplicationCommandOpenAlertsSettings new] executeWithArgs:args];
}

@end
