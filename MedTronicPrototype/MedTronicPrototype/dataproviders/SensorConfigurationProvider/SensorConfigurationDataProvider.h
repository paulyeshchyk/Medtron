//
//  SensorConfigurationDataProvider.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "CoreDataProvider.h"
#import "DataProviderProtocol.h"
@class SensorEntity;
@class SensorTypeEntity;

@interface SensorConfigurationDataProvider : CoreDataProvider <DataProviderProtocol>
+ (SensorConfigurationDataProvider*)sharedInstance;
- (void)performLoadConfigurationWithFilter:(NSPredicate*)filter delegate:(id<DataProviderDelegate>)delegate userInfo:(id)userInfo;
- (id)addConfigurationWithSensorID:(NSManagedObjectID*)sensorID andSensorTypeID:(NSManagedObjectID*)sensorTypeID;
@end
