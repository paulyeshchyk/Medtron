//
//  SensorDataProvider.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "SensorDataProvider.h"
#import "SensorEntity.h"


@implementation SensorDataProvider
static SensorDataProvider *sharedInstance_ = nil;

+ (SensorDataProvider*)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance_ = [[self alloc] init];
    });
    return sharedInstance_;
}

- (NSString*)entityName {
    return kSensorEntity;
}

- (id)addSensorName:(NSString*)sensorName sensorType:(NSManagedObjectID*)sensorTypeId{
    SensorEntity* entity = [self newEntity];
    entity.name = sensorName;

    id object = [self anyObjectByObjectId:sensorTypeId];
    entity.sensortypes = object;
    
    return [entity objectID];
    
}

- (void)performLoadSensorsWithFilter:(NSPredicate*)filter delegate:(id<DataProviderDelegate>)delegate userInfo:(id)userInfo{
    NSError* error = nil;
    NSArray* properties = nil;
    NSArray* result = [self itemsForPredicate:filter
                                     userInfo:userInfo
                                   properties:properties
                            relationshipNames:nil
                                   fetchLimit:NSUIntegerMax
                              sortDescriptors:nil
                                        error:&error];
    
    [delegate provider:self didFinishExecuteFetchWithResult:result andError:error userInfo:userInfo];
}


@end
