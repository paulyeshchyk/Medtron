//
//  BlogHeadlineViewController.h
//  MedTronicPrototype
//
//  Created by Pavel on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlogEntity.h"

@interface BlogHeadlineViewController : UIViewController
+ (BlogHeadlineViewController*)newInstanceForIndex:(NSInteger)index;
+ (BlogHeadlineViewController*)newInstanceForBlogEntity:(BlogEntity*)blogEntity index:(NSInteger)index;

@property (nonatomic, assign)NSInteger index;
@property (nonatomic, strong)BlogEntity* blogEntity;
@end
