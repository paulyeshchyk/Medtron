//
//  InitialPathViewController.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/8/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "InitialPathViewController.h"
#import "UIImageUtils.h"
#import "SensorsSelectorViewController.h"
#import "InfusionSelectorViewController.h"

@interface InitialPathViewController () <UIScrollViewDelegate>{
    IBOutlet UIView* container_;
    IBOutlet UIScrollView* scrollView_;
    IBOutlet UIView* pumpDescriptionView_;
    IBOutlet UIView* pumpView_;
    IBOutlet UIView* infusionDescriptionView_;
    IBOutlet UIView* infusionView_;
    IBOutlet SensorsSelectorViewController* sensorsSelectorViewController_;
    IBOutlet InfusionSelectorViewController* infusionViewController_;
}
@end

@implementation InitialPathViewController


+(void)newInstanceInsideNavigationController:(UINavigationController*)navController pushWithCloseBlock:(InitialPathControllerCloseActionBlock)block {
    InitialPathViewController* result = [[InitialPathViewController alloc] initWithNibName:@"InitialPathViewController" bundle:[NSBundle mainBundle]];

    
    [result setOnCloseBlock:^(id sender){

        [sender dismissViewControllerAnimated:NO completion:NULL];

        if(block != NULL){
            block(sender);
        }
        
    }];
    
    [navController presentViewController:result animated:NO completion:NULL];


}

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
    container_.layer.mask = [UIImageUtils clipLayerForBounds:container_.bounds withCornerRadius:5.0f];
    
    CGRect scrollViewFrame = CGRectZero;
    CGSize contentSize = CGSizeZero;
    CGFloat contentWidth = scrollView_.bounds.size.width;
    CGFloat contentHeight = 20000;

    contentSize = [pumpDescriptionView_ sizeThatFits:CGSizeMake(contentWidth,contentHeight)];
    [scrollView_ setContentSize:CGSizeMake(contentWidth,CGRectGetMaxY(scrollViewFrame))];

    [scrollView_ addSubview:pumpDescriptionView_];
    [pumpDescriptionView_ setFrame:scrollViewFrame];
    [pumpDescriptionView_ setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];

    CGSize pumpViewSize = [sensorsSelectorViewController_.view sizeThatFits:CGSizeMake(contentWidth,contentHeight)];
    [pumpView_ setFrame:CGRectMake(pumpView_.frame.origin.x, pumpView_.frame.origin.y,pumpViewSize.width, pumpViewSize.height)];
    [pumpView_ addSubview:sensorsSelectorViewController_.view];
    [sensorsSelectorViewController_.view setFrame:pumpView_.bounds];
    [sensorsSelectorViewController_.view setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];

    scrollViewFrame = CGRectMake(0,CGRectGetMaxY(scrollViewFrame),pumpView_.bounds.size.width,pumpView_.bounds.size.height);

    [scrollView_ setContentSize:CGSizeMake(contentWidth,CGRectGetMaxY(scrollViewFrame))];
    [scrollView_ addSubview:pumpView_];
    [pumpView_ setFrame:scrollViewFrame];

    [infusionDescriptionView_ sizeToFit];
    scrollViewFrame = CGRectMake(0,CGRectGetMaxY(scrollViewFrame),CGRectGetWidth([infusionDescriptionView_ bounds]),CGRectGetHeight([infusionDescriptionView_ bounds]));
    [scrollView_ setContentSize:CGSizeMake(contentWidth,CGRectGetMaxY(scrollViewFrame))];
    [scrollView_ addSubview:infusionDescriptionView_];
    [infusionDescriptionView_ setFrame:scrollViewFrame];

    contentSize = [infusionViewController_.view sizeThatFits:CGSizeMake(contentWidth,contentHeight)];
    [infusionView_ setFrame:CGRectMake(0,CGRectGetMaxY(infusionDescriptionView_.frame),contentSize.width,contentSize.height)];
    [infusionView_ addSubview:infusionViewController_.view];

    scrollViewFrame = CGRectMake(0,CGRectGetMaxY(scrollViewFrame),CGRectGetWidth([infusionView_ bounds]),CGRectGetHeight([infusionView_ bounds]));
    [scrollView_ setContentSize:CGSizeMake(contentWidth,CGRectGetMaxY(scrollViewFrame))];
    [scrollView_ addSubview:infusionView_];
    [infusionView_ setFrame:scrollViewFrame];

    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onAcceptButtonClicked:(id)sender {
    if (_onCloseBlock != NULL){
        _onCloseBlock(self);
    }
    
}

#pragma mark - UIScrollViewDelegate


@end
