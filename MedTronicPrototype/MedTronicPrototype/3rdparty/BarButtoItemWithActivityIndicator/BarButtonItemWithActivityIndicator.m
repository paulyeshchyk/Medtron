//
//  MYMTipsExplanationViewController.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/12/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "BarButtonItemWithActivityIndicator.h"


@interface BarButtonItemWithActivityIndicator (private)
 - (void)applyButtonAction:(SEL)selector withTarget:(id)target;
@end

@implementation BarButtonItemWithActivityIndicator
@synthesize inProgress = inProgress_;
@synthesize activityIndicator;
@synthesize button;


- (id)initWithActivityIndicatorAndSender:(id)sender selector:(SEL)selector{
    CGFloat buttonWidth = 32;
    CGFloat buttonHeight = 32;
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0,0,buttonWidth,buttonHeight)];
    IconedActivityIndicator *aActivityIndicator = [[IconedActivityIndicator alloc] initWithFrame:CGRectMake(0,0,buttonWidth,buttonHeight)];
    UIButton *aButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0,buttonWidth,buttonHeight)];
    [aButton setShowsTouchWhenHighlighted:YES];
    [customView setBackgroundColor:[UIColor clearColor]];
    
    [customView addSubview:aButton];
    [aButton setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [customView addSubview:aActivityIndicator];
    [aActivityIndicator setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];

    [customView sendSubviewToBack:aActivityIndicator];
    
    self = [super initWithCustomView:customView];
    
    if (self) {
        self.inProgress = NO;
        self.style = UIBarButtonItemStylePlain;
        self.activityIndicator = aActivityIndicator;
        self.button = aButton;
        [self setAction:selector];
        [self setTarget:sender];

    }
    return self;

}

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}


- (void)setAction:(SEL)action{
    [super setAction:action];
    
    [self applyButtonAction:self.action withTarget:self.target];
}

- (void)setTarget:(id)target{
    [super setTarget:target];
    [self applyButtonAction:self.action withTarget:self.target];
}


- (void)setInProgress:(BOOL)value{
    inProgress_ = value;

    [self.activityIndicator setInProgress:inProgress_];

    if (inProgress_){
        [self.button.superview sendSubviewToBack:self.button];
    }else{
        [self.button.superview bringSubviewToFront:self.button];
    }
}

- (void)applyButtonAction:(SEL)selector withTarget:(id)target{
    if (selector == nil) return;
    if (target == nil) return;
    
   
    [self.button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
}

- (void)setEnabled:(BOOL)enabled{
    [super setEnabled:enabled];
    
    self.customView.alpha = enabled?1.0f:0.3f;
}

@end
