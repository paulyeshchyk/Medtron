//
//  MYMAlarmDataProvider.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "CoreDataProvider.h"
#import "DataProviderProtocol.h"

@interface MYMAlarmDataProvider : CoreDataProvider <DataProviderProtocol>
+ (MYMAlarmDataProvider*)sharedInstance;
- (id)addAlarmWithName:(NSString*)name andExplanation:(NSString*)explanation andAlarmTypeID:(NSManagedObjectID*)alarmType;
- (void)performLoadAlarmsWithFilter:(NSPredicate*)filter delegate:(id<DataProviderDelegate>)delegate userInfo:(id)userInfo;
@end
