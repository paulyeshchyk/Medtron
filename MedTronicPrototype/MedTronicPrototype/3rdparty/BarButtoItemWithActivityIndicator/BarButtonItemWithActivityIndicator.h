//
//  MYMTipsExplanationViewController.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/12/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "IconedActivityIndicator.h"

@interface BarButtonItemWithActivityIndicator : UIBarButtonItem{
    BOOL                        inProgress_;
}

- (id)initWithActivityIndicatorAndSender:(id)sender selector:(SEL)selector;

@property (nonatomic, assign) BOOL                          inProgress;
@property (nonatomic) IconedActivityIndicator    *activityIndicator;
@property (nonatomic) UIButton                      *button;
@end
