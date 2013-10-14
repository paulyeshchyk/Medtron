//
//  MYMTipsExplanationViewController.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/12/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IconedActivityIndicator:UIView{
    UIImageView *imageView_;
    BOOL        inProgress_;
    UIActivityIndicatorView *activityView_;
}

@property (nonatomic, assign) BOOL inProgress;

@end

