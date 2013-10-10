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

- (void)saveChanges {
    NSError* error = [[SensorConfigurationDataProvider sharedInstance] saveContext];
    if (error){
        NSLog(@"%@",error.localizedDescription);
    }
    
    error = [[SensorTypeDataProvider sharedInstance] saveContext];
    if (error){
        NSLog(@"%@",error.localizedDescription);
    }
    
}

- (void)rollback {
    [[SensorConfigurationDataProvider sharedInstance] rollback];
    [[SensorTypeDataProvider sharedInstance] rollback];
}

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

- (id)objectAtIndexPath:(NSIndexPath*)indexPath{
    return [[[sensorTypeData_ objectAtIndex:indexPath.section] sensors] objectAtIndex:indexPath.row];
}

- (BOOL)isSensorConfiguredAtIndexPath:(NSIndexPath*)indexPath{
    MYMSensorTypeObject* type = [sensorTypeData_ objectAtIndex:indexPath.section];
    MYMSensorObject* sensor = [type.sensors objectAtIndex:indexPath.row];
    return sensor.configured;
}

- (NSString*)sensorNameAtIndexPath:(NSIndexPath*)indexPath {
    return [[[[sensorTypeData_ objectAtIndex:indexPath.section] sensors] objectAtIndex:indexPath.row] name];
}

- (NSString*)sensorTypeNameAtIndex:(NSInteger)index {
    return [[sensorTypeData_ objectAtIndex:index] name];
}

#pragma mark - DataProviderDelegate
- (void)sensor:(NSManagedObjectID*)sensor markAsConfiguredInConfiguration:(NSManagedObjectID*)configObjectID {
    NSPredicate* predicate =[NSPredicate predicateWithFormat:@"managedObjectID == %@",configObjectID];
    NSArray* types = [sensorTypeData_ filteredArrayUsingPredicate:predicate];
    for(MYMSensorTypeObject* type in types) {
        NSArray* sensors = [type.sensors filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"managedObjectID == %@",sensor]] ;
        for(MYMSensorObject* sen in sensors) {
            sen.configured = YES;
        }
        
    }
}

- (void)provider:(id)dataprovider didFinishExecuteFetchWithResult:(NSArray*)resultArray andError:(NSError*)error userInfo:(id)userInfo {
    if ([userInfo isEqualToString:kDatasetNameSensorType]){
        for(SensorTypeEntity* managedObject in resultArray){
            NSSortDescriptor* sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
            NSArray* sensorsArray = [managedObject.sensors sortedArrayUsingDescriptors:@[sortDescriptor]];
            NSMutableArray* sensorData_ = [NSMutableArray new];
            for(SensorEntity* sensor in sensorsArray){
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
            [self sensor:[managedObject.configurationSensor objectID] markAsConfiguredInConfiguration:[managedObject.configurationSensorType objectID]];
        }
    }
    
    
    providersExecutionCount_++;
    if (providersExecutionCount_ == 2) {
        [self hasFinishedLoad];
    }
    
}

- (void)addConfigurationForIndexPath:(NSIndexPath*)indexPath{
    MYMSensorTypeObject* type = [sensorTypeData_ objectAtIndex:indexPath.section];
    MYMSensorObject* sensor = [type.sensors objectAtIndex:indexPath.row];

   [[SensorConfigurationDataProvider sharedInstance] addConfigurationWithSensorID:[sensor managedObjectID] andSensorTypeID:[type managedObjectID]];
    for(MYMSensorObject* child in type.sensors) {
        child.configured = (child.managedObjectID ==sensor.managedObjectID);
    }
}

@end
