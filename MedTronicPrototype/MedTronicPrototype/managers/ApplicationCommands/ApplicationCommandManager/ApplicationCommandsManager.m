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

@end
