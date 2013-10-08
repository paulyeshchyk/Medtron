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
#import "InfusionViewController.h"

@interface InitialPathViewController () <UIScrollViewDelegate>{
    IBOutlet UIView* container_;
    IBOutlet UIScrollView* scrollView_;
    IBOutlet UIView* pumpDescriptionView_;
    IBOutlet UIView* pumpView_;
    IBOutlet UIView* infusionDescriptionView_;
    IBOutlet UIView* infusionView_;
    IBOutlet SensorsSelectorViewController* sensorsSelectorViewController_;
    IBOutlet InfusionViewController* infusionViewController_;
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
    CGSize newSize = CGSizeZero;
    
    newSize = [pumpDescriptionView_ sizeThatFits:CGSizeMake(scrollView_.bounds.size.width,20000)];
    subviewFrame = CGRectMake(0,CGRectGetMaxY(subviewFrame),newSize.width,newSize.height);
    [scrollView_ addSubview:pumpDescriptionView_];
    [pumpDescriptionView_ setFrame:subviewFrame];
    [scrollView_ setContentSize:CGSizeMake(0,CGRectGetMaxY(subviewFrame))];


    [pumpView_ addSubview:sensorsSelectorViewController_.view];
    [sensorsSelectorViewController_.view setFrame:pumpView_.bounds];
    [sensorsSelectorViewController_.view setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [pumpView_ sizeToFit];
    subviewFrame = CGRectMake(0,CGRectGetMaxY(subviewFrame),CGRectGetWidth([pumpView_ bounds]),CGRectGetHeight([pumpView_ bounds]));
    [scrollView_ addSubview:pumpView_];
    [pumpView_ setFrame:subviewFrame];
    [scrollView_ setContentSize:CGSizeMake(0,CGRectGetMaxY(subviewFrame))];

    [infusionDescriptionView_ sizeToFit];
    subviewFrame = CGRectMake(0,CGRectGetMaxY(subviewFrame),CGRectGetWidth([infusionDescriptionView_ bounds]),CGRectGetHeight([infusionDescriptionView_ bounds]));
    [scrollView_ addSubview:infusionDescriptionView_];
    [infusionDescriptionView_ setFrame:subviewFrame];
    [scrollView_ setContentSize:CGSizeMake(0,CGRectGetMaxY(subviewFrame))];

    [infusionView_ addSubview:infusionViewController_.view];
    [infusionViewController_.view setFrame:infusionView_.bounds];
    [infusionViewController_.view setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [infusionView_ sizeToFit];
    subviewFrame = CGRectMake(0,CGRectGetMaxY(subviewFrame),CGRectGetWidth([infusionView_ bounds]),CGRectGetHeight([infusionView_ bounds]));
    [scrollView_ addSubview:infusionView_];
    [infusionView_ setFrame:subviewFrame];

    
    [scrollView_ setContentSize:CGSizeMake(0,CGRectGetMaxY(subviewFrame))];
    
    
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
