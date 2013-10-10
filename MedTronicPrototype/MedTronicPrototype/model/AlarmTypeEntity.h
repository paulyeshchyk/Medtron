//
//  AlarmTypeEntity.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AlarmEntity;

@interface AlarmTypeEntity : NSManagedObject

@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSSet *alarms;
@end

@interface AlarmTypeEntity (CoreDataGeneratedAccessors)

- (void)addAlarmsObject:(AlarmEntity *)value;
- (void)removeAlarmsObject:(AlarmEntity *)value;
- (void)addAlarms:(NSSet *)values;
- (void)removeAlarms:(NSSet *)values;

@end
