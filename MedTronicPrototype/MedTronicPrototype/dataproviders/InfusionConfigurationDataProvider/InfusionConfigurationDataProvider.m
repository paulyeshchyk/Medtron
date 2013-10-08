//
//  InfusionConfigurationDataProvider.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/8/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "InfusionConfigurationDataProvider.h"
#import "InfusionConfigurationEntity.h"

@implementation InfusionConfigurationDataProvider
static InfusionConfigurationDataProvider *sharedInstance_ = nil;

+ (InfusionConfigurationDataProvider*)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance_ = [[self alloc] init];
    });
    return sharedInstance_;
}

- (id)initWithContext:(NSManagedObjectContext*)context {
    self = [super init];
    if (self){
    }
    return self;
}

- (NSString*)entityName {
    return kEntityInfusionConfiguration;
}

- (void)performLoadConfigurationWithFilter:(NSPredicate*)filter delegate:(id<DataProviderDelegate>)delegate userInfo:(id)userInfo {
    NSError* error = nil;
    NSArray* properties = nil;
    NSArray* result = [self itemsForPredicate:filter userInfo:userInfo properties:properties error:&error];
    
    [delegate provider:self didFinishExecuteFetchWithResult:result andError:error userInfo:userInfo];
}

- (id)switchConfigurationStateForInfusionID:(NSManagedObjectID*)infusionID{
    InfusionConfigurationEntity* result = nil;
    
    NSError* error = nil;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(infusion == %@)", infusionID];
    NSArray* resultArray = [self itemsForPredicate:predicate userInfo:nil properties:nil error:&error];
    
    NSCAssert(([resultArray count] <= 1), @"The only one configuration should be stored for pair of sensor and sensor type");
    
    if ([resultArray count] != 0){
        result = [resultArray lastObject];
        [self removeObject:result];
    } else {
        
        result = [self newEntity];
        result.infusion = [self anyObjectByObjectId:infusionID];
    }
    
    
    [self saveContext];
    return [result objectID];
}

@end
