//
//  SensorTypeEntity.h
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/7/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SensorConfigurationEntity, SensorEntity;

@interface SensorTypeEntity : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *sensors;
@property (nonatomic, retain) SensorConfigurationEntity *configuration;
@end

@interface SensorTypeEntity (CoreDataGeneratedAccessors)

- (void)addSensorsObject:(SensorEntity *)value;
- (void)removeSensorsObject:(SensorEntity *)value;
- (void)addSensors:(NSSet *)values;
- (void)removeSensors:(NSSet *)values;

@end
