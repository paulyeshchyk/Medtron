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

- (id)initWithContext:(NSManagedObjectContext*)context {
    self = [super init];
    if (self){
    }
    return self;
}

- (NSString*)entityName {
    return kEntitySensor;
}

- (id)addSensorName:(NSString*)sensorName sensorType:(NSManagedObjectID*)sensorTypeId{
    SensorEntity* sensorEntity = [self newEntity];
    sensorEntity.name = sensorName;

    id object = [self anyObjectByObjectId:sensorTypeId];
    sensorEntity.sensortypes = object;
    
    [self saveContext];
    return [sensorEntity objectID];
    
}

- (void)performLoadSensorsWithFilter:(NSPredicate*)filter delegate:(id<DataProviderDelegate>)delegate userInfo:(id)userInfo{
    NSError* error = nil;
    NSArray* properties = nil;
    NSArray* result = [self itemsForPredicate:filter userInfo:userInfo properties:properties error:&error];
    
    [delegate provider:self didFinishExecuteFetchWithResult:result andError:error userInfo:userInfo];
}


@end
