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
    NSMutableArray* alarmData_;
    NSManagedObjectID* alarmTypeID_;
}
@end

@implementation MYMPumpAndSensorAlarmsDataset

- (id)init {
    self = [super init];
    if(self){
        alarmData_ = [NSMutableArray new];
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
    
    return [alarmData_ count];
}

- (id)objectAtIndexPath:(NSIndexPath*)indexPath {
    return [alarmData_ objectAtIndex:indexPath.row];
}

- (NSString*)alarmNameAtIndexPath:(NSIndexPath*)indexPath {
    AlarmEntity* alarm =[alarmData_ objectAtIndex:indexPath.row];
    return alarm.name;
}

- (void)provider:(id)dataprovider didFinishExecuteFetchWithResult:(NSArray*)resultArray andError:(NSError*)error userInfo:(id)userInfo {
    
    [alarmData_ addObjectsFromArray:resultArray];
    
    [self hasFinishedLoad];
    
}

@end
