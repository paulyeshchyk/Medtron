//
//  InfusionViewController.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/8/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "InfusionSelectorViewController.h"
#import "InfusionEntity.h"
#import "MedtronicCellProtocols.h"
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

- (BOOL)isInfusionConfiguredAtSection:(NSInteger)section andRow:(NSInteger)row {
    return [dataset_ isInfusionConfiguredAtSection:section andRow:row];
}

- (NSString*)infusionNameAtSection:(NSInteger)section andRow:(NSInteger)row {
    return  [dataset_ infusionNameAtSection:section andRow:row];
}


- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return [dataset_ numberOfRowsInSection:section];
}

- (void)switchStateForInfusionAtSection:(NSInteger)section andRow:(NSInteger)row {
    [dataset_ switchStateForInfusionAtSection:section andRow:row];
}

- (void)willStartLoadDataset:(id<MYMDatasetProtocol>)dataset {

}

- (void)didEndLoadDataset:(id<MYMDatasetProtocol>)dataset {
    [infusionView_ reloadView];
}


@end
