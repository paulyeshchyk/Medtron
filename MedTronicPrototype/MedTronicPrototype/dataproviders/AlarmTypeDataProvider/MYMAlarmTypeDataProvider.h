//
//  MYMAlarmTypeDataProvider.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "CoreDataProvider.h"
#import "DataProviderProtocol.h"

@interface MYMAlarmTypeDataProvider : CoreDataProvider <DataProviderProtocol>
+ (MYMAlarmTypeDataProvider*)sharedInstance;
- (id)addAlarmTypeWithName:(NSString*)name;
- (void)performLoadAlarmTypessWithFilter:(NSPredicate*)filter delegate:(id<DataProviderDelegate>)delegate userInfo:(id)userInfo;
@end
