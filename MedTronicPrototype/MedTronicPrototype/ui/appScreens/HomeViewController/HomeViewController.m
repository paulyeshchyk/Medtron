//
//  HomeViewController.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "HomeViewController.h"
#import "TermsAndConditionsViewController.h"
#import "UserStandardDefaultsManager.h"
#import "StubdataManager.h"
#import "MYMInitialPathViewController.h"

@interface HomeViewController () <UITabBarControllerDelegate>{
    NSDictionary* args_;
}
@end

@implementation HomeViewController

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
    args_ = nil;
    [self.tabBarController.tabBar setHidden:YES];
    [self.navigationController setNavigationBarHidden:YES];
    
    
    [TermsAndConditionsViewController navigationController:self.navigationController askUserToAcceptText:^(id sender, BOOL accepted, BOOL wasFirstTime) {

        if (accepted) {


            UIView* viewToOpen = self.tabBarController.view;
            [self.view addSubview:viewToOpen];
            [viewToOpen setFrame:self.view.bounds];

            if (wasFirstTime){
                
                [StubdataManager performExecution];
                [MYMInitialPathViewController newInstanceInsideNavigationController:self.navigationController pushWithCloseBlock:NULL];

            }
        }
    }];

}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)openTabHome:(NSDictionary*)args {
    UINavigationController* navController = [[self.tabBarController viewControllers] objectAtIndex:0];
    MYMViewController* viewController = (MYMViewController*)navController.topViewController;
    [viewController setArgs:args];
    [self.tabBarController setSelectedViewController:navController];
    [self tabBarController:self.tabBarController didSelectViewController:navController];
}

- (void)openTabBlog:(NSDictionary*)args {
    UINavigationController* navController = [[self.tabBarController viewControllers] objectAtIndex:1];
    MYMViewController* viewController = (MYMViewController*)navController.topViewController;
    [viewController setArgs:args];
    [self.tabBarController setSelectedViewController:navController];
    [self tabBarController:self.tabBarController didSelectViewController:navController];
}

- (void)openTabActions:(NSDictionary*)args {
    UINavigationController* navController = [[self.tabBarController viewControllers] objectAtIndex:2];
    MYMViewController* viewController = (MYMViewController*)navController.topViewController;
    [viewController setArgs:args];
    [self.tabBarController setSelectedViewController:navController];
    [self tabBarController:self.tabBarController didSelectViewController:navController];
}

- (void)openTabHelp:(NSDictionary*)args {
    UINavigationController* navController = [[self.tabBarController viewControllers] objectAtIndex:3];
    MYMViewController* viewController = (MYMViewController*)navController.topViewController;
    [viewController setArgs:args];
    [self.tabBarController setSelectedViewController:navController];
    [self tabBarController:self.tabBarController didSelectViewController:navController];
}

- (void)openTabMyOrder:(NSDictionary*)args {
    UINavigationController* navController = [[self.tabBarController viewControllers] objectAtIndex:4];
    MYMViewController* viewController = (MYMViewController*)navController.topViewController;
    [viewController setArgs:args];
    [self.tabBarController setSelectedViewController:navController];
    [self tabBarController:self.tabBarController didSelectViewController:navController];
}

- (void)openTabSettings:(NSDictionary*)args {
    UINavigationController* navController = [[self.tabBarController viewControllers] objectAtIndex:5];
    MYMViewController* viewController = (MYMViewController*)navController.topViewController;
    [viewController setArgs:args];
    [self.tabBarController setSelectedViewController:navController];
    [self tabBarController:self.tabBarController didSelectViewController:navController];
}

#pragma mark - UITabBarDelegate 
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    //hide tab bar only when the first tab is selected
    BOOL hidden = ([[tabBarController viewControllers] indexOfObject:viewController] == 0);
    [tabBarController.tabBar setHidden:hidden];

}

@end
