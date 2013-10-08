//
//  SettingsViewController.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "SettingsViewController.h"
#import "SensorsSelectorViewController.h"
#import "InfusionSelectorViewController.h"

@interface SettingsViewController () {
    IBOutlet SensorsSelectorViewController* sensorSelectorViewController_;
    IBOutlet InfusionSelectorViewController* infusionSelectorViewController_;
    IBOutlet UIScrollView* scrollView_;
}

@end

@implementation SettingsViewController

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
    CGSize sensorViewSize = [sensorSelectorViewController_.view sizeThatFits:CGSizeMake(CGRectGetWidth(scrollView_.bounds),20000)];
    CGSize infusionViewSize = [infusionSelectorViewController_.view sizeThatFits:CGSizeMake(CGRectGetWidth(scrollView_.bounds),20000)];
    [scrollView_ addSubview:sensorSelectorViewController_.view];
    [sensorSelectorViewController_.view setFrame:CGRectMake(0,0,sensorViewSize.width,sensorViewSize.height)];
    [scrollView_ addSubview:infusionSelectorViewController_.view];
    [infusionSelectorViewController_.view setFrame:CGRectMake(0,sensorViewSize.height,infusionViewSize.width,infusionViewSize.height)];
    [scrollView_ setContentSize:CGSizeMake(CGRectGetWidth(scrollView_.bounds),CGRectGetMaxY(infusionSelectorViewController_.view.frame))];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
