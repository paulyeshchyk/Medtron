//
//  SensorTypeDataProvider.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "CoreDataProvider.h"
#import "DataProviderProtocol.h"

@interface SensorTypeDataProvider : CoreDataProvider <DataProviderProtocol>
+ (SensorTypeDataProvider*)sharedInstance;
- (id)addSensorTypeName:(NSString*)sensorTypeName;
- (void)performLoadSensorTypesWithFilter:(NSPredicate*)filter delegate:(id<DataProviderDelegate>)delegate userInfo:(id)userInfo;
@end
