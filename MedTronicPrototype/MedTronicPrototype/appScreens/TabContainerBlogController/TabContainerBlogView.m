//
//  TabContainerBlogView.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "TabContainerBlogView.h"
#import "UIImageUtils.h"

@interface TabContainerBlogView(){
    CALayer* gradientLayer_;
}
@end

@implementation TabContainerBlogView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    gradientLayer_ = [UIImageUtils gradientLayerWithColors:[UIColor colorWithRed:91.0f/255.0f green:149.0f/255.0f blue:219.0f/255.9f alpha:1]];
    [gradientLayer_ setFrame:self.layer.bounds];
    [self.layer insertSublayer:gradientLayer_ atIndex:0];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    gradientLayer_.frame  = self.layer.bounds;
}

@end
