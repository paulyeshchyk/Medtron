//
//  MYMAlarmTypeDataProvider.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMAlarmTypeDataProvider.h"
#import "AlarmTypeEntity.h"

@implementation MYMAlarmTypeDataProvider
static MYMAlarmTypeDataProvider *sharedInstance_ = nil;

+ (MYMAlarmTypeDataProvider*)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance_ = [[self alloc] init];
    });
    return sharedInstance_;
}

- (NSString*)entityName {
    return kAlarmTypeEntity;
}

- (id)addAlarmTypeWithName:(NSString*)name{
    AlarmTypeEntity* entity = [self newEntity];
    entity.name = name;
    
    return [entity objectID];
}


- (void)performLoadAlarmTypessWithFilter:(NSPredicate*)filter delegate:(id<DataProviderDelegate>)delegate userInfo:(id)userInfo{
    NSError* error = nil;
    NSArray* properties = nil;
    NSArray* result = [self itemsForPredicate:filter
                                     userInfo:nil
                                   properties:properties
                            relationshipNames:@[@"alarms"]
                                   fetchLimit:NSUIntegerMax
                              sortDescriptors:nil
                                        error:&error];
    
    [delegate provider:self didFinishExecuteFetchWithResult:result andError:error userInfo:nil];
}

@end
