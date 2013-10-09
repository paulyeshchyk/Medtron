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

static NSString* const kDatasetNameSensorType = @"sensorType";
static NSString* const kDatasetNameSensorConfiguration = @"sensorConfiguration";
static NSString* const kDatasetNameSensor = @"sensor";

@interface SensorsSelectorViewController ()  <DataProviderDelegate, SensorSelectorViewDatasource> {
    NSArray* sensorTypes_;
    NSUInteger providersExecutionCount_;
    NSMutableDictionary* resultset_;
    UIView<SensorSelectorViewProtocol>* sensorSelectorView_;
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
    
    providersExecutionCount_ = 0;
    [[SensorTypeDataProvider sharedInstance] performLoadSensorTypesWithFilter:nil delegate:self userInfo:kDatasetNameSensorType];
    [[SensorConfigurationDataProvider sharedInstance] performLoadConfigurationWithFilter:nil delegate:self userInfo:kDatasetNameSensorConfiguration];

    [sensorSelectorView_ reloadView];
}




#pragma mark - DataProviderDelegate
- (void)provider:(id)dataprovider didFinishExecuteFetchWithResult:(NSArray*)resultArray andError:(NSError*)error userInfo:(id)userInfo {
    [resultset_ setObject:resultArray forKey:userInfo];
    
    providersExecutionCount_++;
    if (providersExecutionCount_ == 2) {
         [sensorSelectorView_ reloadView];
    }
}

#pragma mark - datasets
- (id)datasetSensorConfiguration {
    return [resultset_ objectForKey:kDatasetNameSensorConfiguration];
}

#pragma mark - SensorSelectorViewDatasource
- (void)makeConfigurationForSensor:(id)sensor andSensorType:(id)sensorType {
    [[SensorConfigurationDataProvider sharedInstance] addConfigurationWithSensorID:[sensor objectID] andSensorTypeID:[sensorType objectID]];
}


- (BOOL)isSensorConfigured:(id)sensorID {
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"configurationSensor == %@",sensorID];
    NSArray* configurations = [self datasetSensorConfiguration];
    NSArray* array = [configurations filteredArrayUsingPredicate:predicate];
    return ([array count] != 0);
}

- (id)datasetSensorType {
    return [resultset_ objectForKey:kDatasetNameSensorType];
}

- (id)sensorTypeAtIndex:(NSInteger)index {
    return [[self datasetSensorType] objectAtIndex:index];
}

- (id)sensorAtIndexPath:(NSIndexPath*)indexPath {
    SensorTypeEntity* sensorType = [self sensorTypeAtIndex:indexPath.section];
    return [[[sensorType sensors] allObjects] objectAtIndex:indexPath.row];
}


@end
