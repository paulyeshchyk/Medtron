//
//  UIAppearanceManager.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "UIAppearanceManager.h"

@implementation UIAppearanceManager

+ (void)applyPageControlAppearance {
    [[UIPageControl appearance] setPageIndicatorTintColor:[UIColor blueColor]];
    [[UIPageControl appearance] setCurrentPageIndicatorTintColor:[UIColor orangeColor]];
}

+(void)applyStatusBarAppearance {
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

+ (void)applyAppearance {
    [self applyPageControlAppearance];
    [self applyStatusBarAppearance];
}
@end
