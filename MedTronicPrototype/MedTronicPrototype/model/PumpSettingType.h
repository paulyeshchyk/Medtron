//
//  PumpSettingType.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/10/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PumpSetting;

@interface PumpSettingType : NSManagedObject

@property (nonatomic, retain) NSSet *pumpSetting;
@end

@interface PumpSettingType (CoreDataGeneratedAccessors)

- (void)addPumpSettingObject:(PumpSetting *)value;
- (void)removePumpSettingObject:(PumpSetting *)value;
- (void)addPumpSetting:(NSSet *)values;
- (void)removePumpSetting:(NSSet *)values;

@end
