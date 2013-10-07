//
//  SensorEntity.h
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/7/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SensorConfigurationEntity, SensorTypeEntity;

@interface SensorEntity : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) SensorTypeEntity *sensortypes;
@property (nonatomic, retain) SensorConfigurationEntity *configuration;

@end
