//
//  SensorTypeDependenceDataProvider.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "CoreDataProvider.h"
#import "DataProviderProtocol.h"

@interface SensorTypeDependenceDataProvider : CoreDataProvider <DataProviderProtocol>
+ (SensorTypeDependenceDataProvider*)sharedInstance;
- (id)setSensor:(NSManagedObjectID*)sensorId dependingOnType:(NSManagedObjectID*)sensorTypeId;
@end
