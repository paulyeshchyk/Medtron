//
//  InfusionViewController.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/8/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "InfusionSelectorViewController.h"
#import "InfusionEntity.h"
#import "MYMCellProtocols.h"
#import "DataProviderProtocol.h"
#import "InfusionConfigurationDataProvider.h"
#import "InfusionDataProvider.h"
#import "InfusionSelectorViewProtocol.h"
#import "MYMInfusionDataset.h"
#import "MYMDatasetProtocol.h"


@interface InfusionSelectorViewController () <MYMDatasetDelegate,InfusionSelectorViewDatasource>{
    NSArray* sensorTypes_;
    NSUInteger providersExecutionCount_;
    NSMutableDictionary* resultset_;
    UIView<InfusionSelectorViewProtocol>* infusionView_;
    MYMInfusionDataset* dataset_;
    
}

@end

@implementation InfusionSelectorViewController

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
    
    infusionView_ = (UIView<InfusionSelectorViewProtocol>*)self.view;
    infusionView_.datasource = self;

    dataset_ = [MYMInfusionDataset new];
    dataset_.delegate = self;
    [dataset_ reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
- (void)saveChanges {
    [dataset_ saveChanges];
}

- (void)rollbackChanges {
    [dataset_ rollback];
}

- (NSInteger)numberOfSections {
    return [dataset_ sectionsCount];
}

- (NSString*)sectionNameAtIndex:(NSInteger)index {
    return [dataset_ sectionAtIndex:index];
}

- (BOOL)isInfusionConfiguredAtIndexPath:(NSIndexPath*)indexPath{
    return [dataset_ isInfusionConfiguredAtIndexPath:indexPath];
}

- (NSString*)infusionNameAtIndexPath:(NSIndexPath*)indexPath{
    return  [dataset_ infusionNameAtIndexPath:indexPath];
}


- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return [dataset_ numberOfRowsInSection:section];
}

- (void)switchStateForInfusionAtIndexPath:(NSIndexPath*)indexPath{
    [dataset_ switchStateForInfusionAtIndexPath:indexPath];
}

- (void)willStartLoadDataset:(id<MYMDatasetProtocol>)dataset {

}

- (void)didEndLoadDataset:(id<MYMDatasetProtocol>)dataset {
    [infusionView_ reloadView];
}


@end
