//
//  MYMInfusionDataset.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/9/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMInfusionObject.h"
#import "MYMInfusionDataset.h"
#import "InfusionDataProvider.h"
#import "InfusionConfigurationDataProvider.h"
#import "InfusionEntity.h"
#import "InfusionConfigurationEntity.h"

static NSString* const kDatasetNameInfusion = @"kDatasetNameInfusion";
static NSString* const kDatasetNameInfusionConfiguration = @"kDatasetNameInfusionConfiguration";

@interface MYMInfusionDataset()<DataProviderDelegate>{
    NSInteger providersExecutionCount_;
    NSMutableArray* data_;
}
@end

@implementation MYMInfusionDataset

@synthesize delegate;

- (void)switchStateForInfusionAtIndexPath:(NSIndexPath*)indexPath{
    
    MYMInfusionObject* obj = [self objectAtIndexPath:indexPath];
    
    NSManagedObjectID* objID = obj.managedObjectID;
    NSManagedObjectID* infusionConfigurationID = [[InfusionConfigurationDataProvider sharedInstance] switchStateForInfusionID:objID];
    obj.configured = (infusionConfigurationID != nil);
}

- (BOOL)isInfusionConfiguredAtIndexPath:(NSIndexPath*)indexPath{
    MYMInfusionObject* obj = [self objectAtIndexPath:indexPath];

    return (obj.configured);
}

- (NSString*)infusionNameAtIndexPath:(NSIndexPath*)indexPath{
    MYMInfusionObject* obj = [data_ objectAtIndex:indexPath.row];
    return obj.name;
}

- (void)reloadData {
    
    [self willStartLoad];

    data_ = [NSMutableArray new];
    
    providersExecutionCount_ = 0;
    [[InfusionDataProvider sharedInstance] performLoadConfigurationWithFilter:nil delegate:self userInfo:kDatasetNameInfusion];
    [[InfusionConfigurationDataProvider sharedInstance] performLoadConfigurationWithFilter:nil delegate:self userInfo:kDatasetNameInfusionConfiguration];
}

- (NSInteger)sectionsCount {
    return 0;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return [data_ count];
}

- (id)sectionAtIndex:(NSInteger)index {
    return nil;
}

- (id)objectAtIndexPath:(NSIndexPath*)indexPath{
    return [data_ objectAtIndex:indexPath.row];
}

#pragma mark - DataProviderDelegate
- (void)provider:(id)dataprovider didFinishExecuteFetchWithResult:(NSArray*)resultArray andError:(NSError*)error userInfo:(id)userInfo {
    
    if ([userInfo isEqualToString:kDatasetNameInfusion]){
        for(InfusionEntity* managedObject in resultArray){
            NSArray* array = [data_ filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"managedObjectID == %@",[managedObject objectID]]];
            if ([array count] > 0){
                for(MYMInfusionObject* existedObject in array){
                    existedObject.configured = YES;
                }
            } else {
                MYMInfusionObject* obj = [MYMInfusionObject new];
                obj.name = [managedObject name];
                obj.managedObjectID = [managedObject objectID];
                obj.configured = NO;
                [data_ addObject:obj];
            }
        }
    } else if ([userInfo isEqualToString:kDatasetNameInfusionConfiguration]) {
        for(InfusionConfigurationEntity* managedObject in resultArray){
            NSArray* array = [data_ filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"managedObjectID == %@",[managedObject.infusion objectID]]];
            if ([array count] > 0){
                for(MYMInfusionObject* existedObject in array){
                    existedObject.configured = YES;
                }
            } else {
                MYMInfusionObject* obj = [MYMInfusionObject new];
                obj.name = [managedObject.infusion name];
                obj.managedObjectID = [managedObject.infusion objectID];
                obj.configured = YES;
                [data_ addObject:obj];
            }
        }
    }
    
    providersExecutionCount_++;
    if (providersExecutionCount_ == 2) {
        [self hasFinishedLoad];
    }
    
}

@end
