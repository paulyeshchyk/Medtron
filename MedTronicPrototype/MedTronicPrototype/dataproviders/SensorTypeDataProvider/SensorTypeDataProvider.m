//
//  SensorTypeDataProvider.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "SensorTypeDataProvider.h"
#import "SensorTypeEntity.h"

@implementation SensorTypeDataProvider
static SensorTypeDataProvider *sharedInstance_ = nil;

+ (SensorTypeDataProvider*)sharedInstance{
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
    return kEntitySensorType;
}

- (id)addSensorTypeName:(NSString*)sensorTypeName {
    SensorTypeEntity* sensorTypeEntity = [self newEntity];
    sensorTypeEntity.name = sensorTypeName;
    
    [self saveContext];
    return [sensorTypeEntity objectID];
}

- (void)performLoadSensorTypesWithFilter:(NSPredicate*)filter delegate:(id<DataProviderDelegate>)delegate userInfo:(id)userInfo{
    NSError* error = nil;
    NSArray* properties = nil;//@[@"author",@"headline",@"body"];
    NSArray* result = [self itemsForPredicate:filter userInfo:userInfo properties:properties error:&error];
    
    [delegate provider:self didFinishExecuteFetchWithResult:result andError:error userInfo:userInfo];
}


@end
