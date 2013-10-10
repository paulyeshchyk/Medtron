//
//  SensorEntity.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/10/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SensorConfigurationEntity, SensorTypeEntity;

@interface SensorEntity : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) SensorConfigurationEntity *configuration;
@property (nonatomic, retain) SensorTypeEntity *sensortypes;

@end
