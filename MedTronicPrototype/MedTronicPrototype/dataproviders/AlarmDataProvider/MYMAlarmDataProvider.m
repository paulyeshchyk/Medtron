//
//  MYMAlarmDataProvider.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMAlarmDataProvider.h"
#import "AlarmEntity.h"

@implementation MYMAlarmDataProvider

static MYMAlarmDataProvider *sharedInstance_ = nil;

+ (MYMAlarmDataProvider*)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance_ = [[self alloc] init];
    });
    return sharedInstance_;
}

- (NSString*)entityName {
    return kAlarmEntity;
}

- (id)addAlarmWithName:(NSString*)name andExplanation:(NSString*)explanation andAlarmTypeID:(NSManagedObjectID*)alarmType{
    AlarmEntity* entity = [self newEntity];
    entity.name = name;
    entity.explanation = explanation;
    entity.alarmType = [self anyObjectByObjectId:alarmType];
    
    return [entity objectID];
}


- (void)performLoadAlarmsWithFilter:(NSPredicate*)filter delegate:(id<DataProviderDelegate>)delegate userInfo:(id)userInfo{
    NSError* error = nil;
    NSArray* properties = nil;
    NSArray* result = [self itemsForPredicate:filter
                                     userInfo:nil
                                   properties:properties
                            relationshipNames:@[@"alarmType"]
                                   fetchLimit:NSUIntegerMax
                              sortDescriptors:nil
                                        error:&error];
    
    [delegate provider:self didFinishExecuteFetchWithResult:result andError:error userInfo:nil];
}

@end
