//
//  SensorDataProvider.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "CoreDataProvider.h"
#import "DataProviderProtocol.h"

@interface SensorDataProvider : CoreDataProvider <DataProviderProtocol>
+ (SensorDataProvider*)sharedInstance;
- (id)addSensorName:(NSString*)sensorName sensorType:(NSManagedObjectID*)sensorTypeId;
- (void)performLoadSensorsWithFilter:(NSPredicate*)filter delegate:(id<DataProviderDelegate>)delegate userInfo:(id)userInfo;
@end
