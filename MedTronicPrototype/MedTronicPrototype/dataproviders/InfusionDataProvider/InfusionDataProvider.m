//
//  InfusionDataProvider.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/8/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "InfusionDataProvider.h"
#import "InfusionEntity.h"

@implementation InfusionDataProvider
static InfusionDataProvider *sharedInstance_ = nil;

+ (InfusionDataProvider*)sharedInstance{
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
    return kInfusionEntity;
}

- (void)performLoadConfigurationWithFilter:(NSPredicate*)filter delegate:(id<DataProviderDelegate>)delegate userInfo:(id)userInfo {
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

- (id)addInfusionName:(NSString*)name{
    InfusionEntity* infusionEntity = [self newEntity];
    infusionEntity.name = name;
    
    
    return [infusionEntity objectID];
    
}

@end
