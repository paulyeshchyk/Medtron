//
//  SensorConfigurationDataProvider.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "SensorConfigurationDataProvider.h"
#import "SensorConfigurationEntity.h"

@implementation SensorConfigurationDataProvider
static SensorConfigurationDataProvider *sharedInstance_ = nil;

+ (SensorConfigurationDataProvider*)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance_ = [[self alloc] init];
    });
    return sharedInstance_;
}

- (id)initWithContext:(NSManagedObjectContext*)context {
    self = [super init];
    if (self){
    }
    return self;
}

- (NSString*)entityName {
    return kEntitySensorConfiguration;
}


- (id)addConfigurationWithSensorID:(NSManagedObjectID*)sensorID andSensorTypeID:(NSManagedObjectID*)sensorTypeID {
    __block SensorConfigurationEntity* result = nil;

    NSError* error = nil;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(configurationSensorType == %@) OR (configurationSensor == %@)", sensorTypeID, sensorID];
    NSArray* resultArray = [self itemsForPredicate:predicate
                                          userInfo:nil
                                        properties:nil
                                 relationshipNames:@[@"configurationSensorType",@"configurationSensor"]
                                        fetchLimit:NSUIntegerMax
                                   sortDescriptors:nil
                                             error:&error];
    
    NSCAssert(([resultArray count] <= 1), @"The only one configuration should be stored for pair of sensor and sensor type");

    if ([resultArray count] != 0){
        result = [resultArray lastObject];
        result.configurationSensorType = [self anyObjectByObjectId:sensorTypeID];
        result.configurationSensor = [self anyObjectByObjectId:sensorID];
    } else {
    
        result = [self newEntity];
        result.configurationSensorType = [self anyObjectByObjectId:sensorTypeID];
        result.configurationSensor = [self anyObjectByObjectId:sensorID];
    }

    [self saveContext];

    return [result objectID];
}

- (void)performLoadConfigurationWithFilter:(NSPredicate*)filter delegate:(id<DataProviderDelegate>)delegate userInfo:(id)userInfo {
    NSError* error = nil;

    NSArray* result = [self itemsForPredicate:filter
                                     userInfo:userInfo
                                   properties:nil
                            relationshipNames:nil
                                   fetchLimit:NSUIntegerMax
                              sortDescriptors:nil
                                        error:&error];
    
    [delegate provider:self didFinishExecuteFetchWithResult:result andError:error userInfo:userInfo];
    
}

@end
