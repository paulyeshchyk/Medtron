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
    
    CGRect subviewFrame = CGRectZero;
    CGSize contentSize = CGSizeZero;
    
    contentSize = [pumpDescriptionView_ sizeThatFits:CGSizeMake(scrollView_.bounds.size.width,20000)];
    
    
    subviewFrame = CGRectMake(0,CGRectGetMaxY(subviewFrame),contentSize.width,contentSize.height);
    [scrollView_ setContentSize:CGSizeMake(0,CGRectGetMaxY(subviewFrame))];
    [scrollView_ addSubview:pumpDescriptionView_];
    [pumpDescriptionView_ setFrame:subviewFrame];


    CGSize sensorViewSize = [sensorsSelectorViewController_.view sizeThatFits:CGSizeMake(scrollView_.bounds.size.width,20000)];
    [pumpView_ addSubview:sensorsSelectorViewController_.view];
//    [sensorsSelectorViewController_.view setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
//    [pumpView_ sizeToFit];

    subviewFrame = CGRectMake(0,CGRectGetMaxY(subviewFrame),sensorViewSize.width,sensorViewSize.height);
    [scrollView_ setContentSize:CGSizeMake(0,CGRectGetMaxY(subviewFrame))];
    [scrollView_ addSubview:pumpView_];
    [pumpView_ setFrame:subviewFrame];

    [infusionDescriptionView_ sizeToFit];
    subviewFrame = CGRectMake(0,CGRectGetMaxY(subviewFrame),CGRectGetWidth([infusionDescriptionView_ bounds]),CGRectGetHeight([infusionDescriptionView_ bounds]));
    [scrollView_ setContentSize:CGSizeMake(0,CGRectGetMaxY(subviewFrame))];
    [scrollView_ addSubview:infusionDescriptionView_];
    [infusionDescriptionView_ setFrame:subviewFrame];

    [infusionView_ addSubview:infusionViewController_.view];
    [infusionViewController_.view setFrame:infusionView_.bounds];
    [infusionViewController_.view setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [infusionView_ sizeToFit];
    subviewFrame = CGRectMake(0,CGRectGetMaxY(subviewFrame),CGRectGetWidth([infusionView_ bounds]),CGRectGetHeight([infusionView_ bounds]));
    [scrollView_ setContentSize:CGSizeMake(0,CGRectGetMaxY(subviewFrame))];
    [scrollView_ addSubview:infusionView_];
    [infusionView_ setFrame:subviewFrame];

    
    
    
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
