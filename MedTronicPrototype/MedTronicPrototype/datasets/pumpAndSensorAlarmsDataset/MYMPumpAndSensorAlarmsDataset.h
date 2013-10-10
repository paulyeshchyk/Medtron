//
//  MYMPumpAndSensorAlarmsDataset.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMDataset.h"
#import "MYMDatasetProtocol.h"

@interface MYMPumpAndSensorAlarmsDataset : MYMDataset <MYMDatasetProtocol>
- (NSString*)alarmNameAtIndexPath:(NSIndexPath*)indexPath;
- (void)setAlarmTypeObjectID:(NSManagedObjectID*)alarmTypeID;
@end
