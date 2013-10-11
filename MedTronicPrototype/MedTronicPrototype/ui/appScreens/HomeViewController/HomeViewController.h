//
//  HomeViewController.h
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMViewController.h"

@interface HomeViewController : MYMViewController
@property (nonatomic, strong)IBOutlet UITabBarController* tabBarController;
- (void)openTabHome:(NSDictionary*)args;
- (void)openTabBlog:(NSDictionary*)args;
- (void)openTabActions:(NSDictionary*)args;
- (void)openTabHelp:(NSDictionary*)args;
- (void)openTabMyOrder:(NSDictionary*)args;
- (void)openTabSettings:(NSDictionary*)args;
@end
