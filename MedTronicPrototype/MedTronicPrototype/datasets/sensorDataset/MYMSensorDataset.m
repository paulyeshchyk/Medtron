//
//  MYMSensorDataset.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/10/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMSensorDataset.h"
#import "SensorTypeDataProvider.h"
#import "SensorConfigurationDataProvider.h"
#import "SensorEntity.h"
#import "SensorConfigurationEntity.h"
#import "MYMSensorObject.h"
#import "MYMSensorTypeObject.h"
#import "SensorTypeEntity.h"

static NSString* const kDatasetNameSensorType = @"sensorType";
static NSString* const kDatasetNameSensorConfiguration = @"sensorConfiguration";
static NSString* const kDatasetNameSensor = @"sensor";

@interface MYMSensorDataset()<DataProviderDelegate>{
    NSInteger providersExecutionCount_;
    NSMutableArray* sensorTypeData_;
}
@end

@implementation MYMSensorDataset
- (void)reloadData {
    sensorTypeData_ = [NSMutableArray new];
    providersExecutionCount_ = 0;
    [[SensorTypeDataProvider sharedInstance] performLoadSensorTypesWithFilter:nil delegate:self userInfo:kDatasetNameSensorType];
    [[SensorConfigurationDataProvider sharedInstance] performLoadConfigurationWithFilter:nil delegate:self userInfo:kDatasetNameSensorConfiguration];

    [self willStartLoad];
    
}

- (NSInteger)sectionsCount {
    return [sensorTypeData_ count];
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return [[[sensorTypeData_ objectAtIndex:section] sensors] count];
}

- (id)sectionAtIndex:(NSInteger)index {
    return [[sensorTypeData_ objectAtIndex:index] name];
}

- (id)objectAtSection:(NSInteger)section andRow:(NSInteger)row {
    return [[[sensorTypeData_ objectAtIndex:section] sensors] objectAtIndex:row];
}

- (BOOL)isSensorConfiguredAtSection:(NSInteger)section andRow:(NSInteger)row {
    MYMSensorTypeObject* type = [sensorTypeData_ objectAtIndex:section];
    MYMSensorObject* sensor = [type.sensors objectAtIndex:row];
    return sensor.configured;
}

- (NSString*)sensorNameAtSection:(NSInteger)section andRow:(NSInteger)row {
    return [[[[sensorTypeData_ objectAtIndex:section] sensors] objectAtIndex:row] name];
}

- (NSString*)sensorTypeNameAtIndex:(NSInteger)index {
    return [[sensorTypeData_ objectAtIndex:index] name];
}

#pragma mark - DataProviderDelegate
- (void)provider:(id)dataprovider didFinishExecuteFetchWithResult:(NSArray*)resultArray andError:(NSError*)error userInfo:(id)userInfo {
    if ([userInfo isEqualToString:kDatasetNameSensorType]){
        for(SensorTypeEntity* managedObject in resultArray){
            

            NSMutableArray* sensorData_ = [NSMutableArray new];
            for(SensorEntity* sensor in managedObject.sensors){
                MYMSensorObject* obj = [MYMSensorObject new];
                obj.name = [sensor name];
                obj.managedObjectID = [sensor objectID];
                obj.configured = NO;
                [sensorData_ addObject:obj];
            }
            
            MYMSensorTypeObject* objType = [MYMSensorTypeObject new];
            [objType setName:managedObject.name];
            [objType setManagedObjectID:[managedObject objectID]];
            [objType setSensors:sensorData_];
            [sensorTypeData_ addObject:objType];
            
        }
    } else if ([userInfo isEqualToString:kDatasetNameSensorConfiguration]) {
        for(SensorConfigurationEntity* managedObject in resultArray){
            NSPredicate* predicate =[NSPredicate predicateWithFormat:@"managedObjectID == %@",[managedObject.configurationSensorType objectID]];
            NSArray* types = [sensorTypeData_ filteredArrayUsingPredicate:predicate];
            for(MYMSensorTypeObject* type in types) {
                NSArray* sensors = [type.sensors filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"managedObjectID == %@",[managedObject.configurationSensor objectID]]];
                for(MYMSensorObject* sen in sensors) {
                    sen.configured = YES;
                }
                
            }
        }
    }
    
    
    providersExecutionCount_++;
    if (providersExecutionCount_ == 2) {
        [self hasFinishedLoad];
    }
    
}

- (void)addConfigurationForSection:(NSInteger)section andRow:(NSInteger)row {
    MYMSensorTypeObject* type = [sensorTypeData_ objectAtIndex:section];
    MYMSensorObject* sensor = [type.sensors objectAtIndex:row];
    sensor.configured = !sensor.configured;
    
   [[SensorConfigurationDataProvider sharedInstance] addConfigurationWithSensorID:[sensor managedObjectID] andSensorTypeID:[type managedObjectID]];
    
}

@end
