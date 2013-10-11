//
//  MYMPumpAndSensorAlarmTypesDataset.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMPumpAndSensorAlarmTypesDataset.h"
#import "DataProviderProtocol.h"
#import "MYMAlarmTypeDataProvider.h"
#import "AlarmTypeEntity.h"

static NSString* const kDatasetNameAlarmType = @"kDatasetNameAlarmType";

@interface MYMPumpAndSensorAlarmTypesDataset() <DataProviderDelegate>{
    NSMutableArray* alarmTypeData_;
    NSInteger providersExecutionCount_;
    
}
@end

@implementation MYMPumpAndSensorAlarmTypesDataset

- (void)saveChanges {
    
}
- (void)rollback {
    
}

- (void)reloadData {
    [self willStartLoad];
    
    alarmTypeData_ = [NSMutableArray new];
    
    providersExecutionCount_ = 0;
    [[MYMAlarmTypeDataProvider sharedInstance] performLoadAlarmTypessWithFilter:nil delegate:self userInfo:kDatasetNameAlarmType];
    
}

- (NSInteger)sectionsCount {
    return 1;
}

- (id)sectionAtIndex:(NSInteger)index {
    return @"";
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return [alarmTypeData_ count];
}

- (id)objectAtIndexPath:(NSIndexPath*)indexPath {
    return [alarmTypeData_ objectAtIndex:indexPath.row];
}

- (NSString*)alarmNameAtIndexPath:(NSIndexPath*)indexPath {
    AlarmTypeEntity* entity = [alarmTypeData_ objectAtIndex:indexPath.row];
    return entity.name;
}

- (void)provider:(id)dataprovider didFinishExecuteFetchWithResult:(NSArray*)resultArray andError:(NSError*)error userInfo:(id)userInfo {
    
    [alarmTypeData_ addObjectsFromArray:resultArray];
    [self hasFinishedLoad];
    
}


@end
