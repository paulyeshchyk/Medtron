//
//  HomeViewController.h
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewControllerWithContext
@property (nonatomic, strong)IBOutlet UITabBarController* tabBarController;
- (void)openTabHome:(NSDictionary*)args;
- (void)openTabBlog:(NSDictionary*)args;
- (void)openTabActions:(NSDictionary*)args;
- (void)openTabHelp:(NSDictionary*)args;
- (void)openTabMyOrder:(NSDictionary*)args;
- (void)openTabSettings:(NSDictionary*)args;
@end
