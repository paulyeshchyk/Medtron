//
//  SensorTypeDependenceDataProvider.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "SensorTypeDependenceDataProvider.h"

#import "SensorDataProvider.h"
#import "SensorTypeDataProvider.h"

@implementation SensorTypeDependenceDataProvider
static SensorTypeDependenceDataProvider *sharedInstance_ = nil;

+ (SensorTypeDependenceDataProvider*)sharedInstance{
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
    return kEntitySensorTypeDependence;
}

- (id)setSensor:(NSManagedObjectID*)sensorId dependingOnType:(NSManagedObjectID*)sensorTypeId {
//    SensonTypeDependenceEntity* sensorTypeDependencyEntity = [self newEntity];
//    sensorTypeDependencyEntity.sensorrelationship = [[SensorDataProvider sharedInstance] objectByObjectId:sensorId];
//    sensorTypeDependencyEntity.sensortyperelationship = [[SensorTypeDataProvider sharedInstance] objectByObjectId:sensorTypeId];
//    
//    return [sensorTypeDependencyEntity objectID];
    return nil;
}
@end
