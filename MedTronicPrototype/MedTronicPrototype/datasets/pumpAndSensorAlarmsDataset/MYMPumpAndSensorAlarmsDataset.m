//
//  MYMPumpAndSensorAlarmsDataset.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMPumpAndSensorAlarmsDataset.h"
#import "DataProviderProtocol.h"
#import "MYMAlarmDataProvider.h"
#import "AlarmEntity.h"
#import "AlarmTypeEntity.h"

static NSString* const kDatasetNameAlarm = @"kDatasetNameAlarm";

@interface MYMPumpAndSensorAlarmsDataset() <DataProviderDelegate>{
    NSMutableArray* data_;
    NSManagedObjectID* alarmTypeID_;
}
@end

@implementation MYMPumpAndSensorAlarmsDataset

- (id)init {
    self = [super init];
    if(self){
        alarmTypeID_ = nil;
    }
    return self;
    
}

- (void)setAlarmTypeObjectID:(NSManagedObjectID*)alarmTypeID {
    alarmTypeID_ = alarmTypeID;
}

- (void)saveChanges {
    
}
- (void)rollback {
    
}

- (void)reloadData {
    [self willStartLoad];

    data_ = [NSMutableArray new];
    NSPredicate* predicate = nil;
    if (alarmTypeID_){
        predicate = [NSPredicate predicateWithFormat:@" alarmType == %@ ",alarmTypeID_];
    }
    
    [[MYMAlarmDataProvider sharedInstance] performLoadAlarmsWithFilter:predicate delegate:self userInfo:kDatasetNameAlarm];
    
}

- (NSInteger)sectionsCount {
    return 1;
}

- (id)sectionAtIndex:(NSInteger)index {
    return @"";
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    
    return [data_ count];
}

- (id)objectAtIndexPath:(NSIndexPath*)indexPath {
    return [data_ objectAtIndex:indexPath.row];
}

- (NSString*)alarmNameAtIndexPath:(NSIndexPath*)indexPath {
    AlarmEntity* alarm =[data_ objectAtIndex:indexPath.row];
    return alarm.name;
}


- (void)deleteObjectsAtIndexPaths:(NSArray*)indexPaths {
    //FIXME:check
    for(NSIndexPath* indexPath in indexPaths) {
        [[MYMAlarmDataProvider sharedInstance] removeObject:[self objectAtIndexPath:indexPath]];
        [data_ removeObjectAtIndex:indexPath.row];
    }
}

- (void)provider:(id)dataprovider didFinishExecuteFetchWithResult:(NSArray*)resultArray andError:(NSError*)error userInfo:(id)userInfo {
    
    [data_ addObjectsFromArray:resultArray];
    
    [self hasFinishedLoad];
    
}

@end
