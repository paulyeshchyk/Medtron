//
//  SensorConfigurationEntity.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/10/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SensorEntity, SensorTypeEntity;

@interface SensorConfigurationEntity : NSManagedObject

@property (nonatomic, retain) SensorEntity *configurationSensor;
@property (nonatomic, retain) SensorTypeEntity *configurationSensorType;

@end
