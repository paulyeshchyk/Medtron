//
//  MYMExpandableViewController.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMExpandableViewController.h"

@interface MYMExpandableViewController () {
}
@property (nonatomic, weak) IBOutlet UIScrollView* scrollView;
@property (nonatomic, weak) UIView* viewToExpand;
@end

@implementation MYMExpandableViewController

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

    self.viewToExpand = [_delegate viewToExpand];

    [self updateScrollViewFrame];
    [self.scrollView addSubview:_viewToExpand];
    [_viewToExpand setFrame:CGRectMake(0,0,100,200)];
    [self.scrollView setContentSize:_viewToExpand.bounds.size];
}

- (void)setDelegate:(id<MYMExpandableViewControllerDelegate>)delegate {
        _delegate = delegate;
    
}

- (void)setViewToExpand:(UIView *)viewToExpand {
    _viewToExpand = viewToExpand;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setIsExpanded:(BOOL)isExpanded {
    if (_isExpanded != isExpanded){
        _isExpanded = isExpanded;
        if ([self isViewLoaded]){
            [UIView animateWithDuration:0.5f animations:^{
                [self updateScrollViewFrame];
            } completion:^(BOOL finished) {
                
            }];
        }
    }
}

- (void)setButtonTitle:(NSString *)buttonTitle {
    _buttonTitle = buttonTitle;
}


- (IBAction)onExpandButtonClicked:(id)sender {
    self.isExpanded = !self.isExpanded;
}


- (void)updateScrollViewFrame {
    CGRect frame = CGRectMake(0,50,CGRectGetWidth(self.view.bounds),_isExpanded?(CGRectGetHeight(self.view.bounds)-50):0);
    [self.scrollView setFrame:frame];
    
}
@end
