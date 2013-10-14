//
//  MYMTipsExplanationViewController.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/12/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "IconedActivityIndicator.h"
#import "UIImage+Tinted.h"
@implementation IconedActivityIndicator
@synthesize inProgress = inProgress_;

- (void)dealloc{
    [imageView_ removeFromSuperview];
    [activityView_ removeFromSuperview];
    
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self != nil){
        UIImage *infoItemImage = [[UIImage imageNamed:@"Basic-Update-icon.png"] tintWithColor:self.tintColor];
        imageView_ = [[UIImageView alloc] initWithImage:infoItemImage];
        [imageView_ setHidden:NO];
        [self addSubview:imageView_];
        [imageView_ setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        
        activityView_ = [[UIActivityIndicatorView alloc] initWithFrame:frame];
        [activityView_ setHidden:YES];
        [activityView_ setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:activityView_];
        [activityView_ setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    }
    return self;
}

- (void)setInProgress:(BOOL)value{
    inProgress_ = value;
    [imageView_ setHidden:inProgress_] ;
    [activityView_ setHidden:!inProgress_];
    if (inProgress_){
        [activityView_ startAnimating];
    }else{
        [activityView_ stopAnimating];
    }
}

@end



