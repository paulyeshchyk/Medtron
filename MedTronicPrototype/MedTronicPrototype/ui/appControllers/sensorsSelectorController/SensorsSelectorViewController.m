//
//  SensorsSelectorViewController.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/8/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "SensorsSelectorViewController.h"
#import "SensorTypeDataProvider.h"
#import "SensorConfigurationDataProvider.h"
#import "SensorDataProvider.h"
#import "SensorTypeEntity.h"
#import "SensorEntity.h"
#import "MedtronicCellProtocols.h"
#import "SensorConfigurationComplexDataProvider.h"
#import "SensorSelectorViewProtocol.h"
#import "MYMSensorDataset.h"


@interface SensorsSelectorViewController ()  <MYMDatasetDelegate, SensorSelectorViewDatasource> {
    NSArray* sensorTypes_;
    NSUInteger providersExecutionCount_;
    NSMutableDictionary* resultset_;
    UIView<SensorSelectorViewProtocol>* sensorSelectorView_;
    MYMSensorDataset* dataset_;
}

@end

@implementation SensorsSelectorViewController

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    sensorSelectorView_ = (UIView<SensorSelectorViewProtocol>*)self.view;
    sensorSelectorView_.datasource = self;

    [self reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
- (void)reloadData {
    resultset_ = [NSMutableDictionary new];
    
    dataset_ = [MYMSensorDataset new];
    dataset_.delegate = self;
    [dataset_ reloadData];
    
    
}

- (void)willStartLoadDataset:(MYMDataset*)dataset {
    
}

- (void)didEndLoadDataset:(MYMDataset*)dataset {
    [sensorSelectorView_ reloadView];
}


- (NSString*)sensorNameAtIndexPath:(NSIndexPath*)indexPath {
    return [dataset_ sensorNameAtIndexPath:indexPath];
}

- (BOOL)isSensorConfiguredAtIndexPath:(NSIndexPath*)indexPath{
    return [dataset_ isSensorConfiguredAtIndexPath:indexPath];
}


- (id)sensorTypeAtIndex:(NSInteger)index {
    return [dataset_ sectionAtIndex:index];
}

- (id)sensorAtIndexPath:(NSIndexPath*)indexPath {
    return [dataset_ sensorNameAtIndexPath:indexPath];
}

- (NSInteger)sensorTypeCount {
    return [dataset_ sectionsCount];
}
- (NSString*)sensorTypeNameAtIndex:(NSInteger)index {
    return [dataset_ sectionAtIndex:index];
}

- (void)addConfigurationForIndexPath:(NSIndexPath*)indexPath{
    [dataset_ addConfigurationForIndexPath:indexPath];
}
- (NSInteger)sensorsCountAtSection:(NSInteger)section {
    return [dataset_ numberOfRowsInSection:section];
}


@end
