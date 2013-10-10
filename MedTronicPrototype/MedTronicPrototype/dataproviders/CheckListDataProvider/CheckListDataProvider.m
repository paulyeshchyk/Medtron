//
//  CheckListDataProvider.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/10/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "CheckListDataProvider.h"
#import "CheckListEntity.h"

@implementation CheckListDataProvider
static CheckListDataProvider *sharedInstance_ = nil;

+ (CheckListDataProvider*)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance_ = [[self alloc] init];
    });
    return sharedInstance_;
}

- (NSString*)entityName {
    return kCheckListEntity;
}

- (id)addCheckListName:(NSString*)sensorTypeName {
    CheckListEntity* entity = [self newEntity];
    entity.name = sensorTypeName;
    
    return [entity objectID];
}

- (void)performLoadCheckListWithFilter:(NSPredicate*)filter delegate:(id<DataProviderDelegate>)delegate userInfo:(id)userInfo{
    NSError* error = nil;
    NSArray* properties = nil;
    NSArray* result = [self itemsForPredicate:filter
                                     userInfo:userInfo
                                   properties:properties
                            relationshipNames:nil
                                   fetchLimit:NSUIntegerMax
                              sortDescriptors:nil
                                        error:&error];
    
    [delegate provider:self didFinishExecuteFetchWithResult:result andError:error userInfo:userInfo];
}


@end
