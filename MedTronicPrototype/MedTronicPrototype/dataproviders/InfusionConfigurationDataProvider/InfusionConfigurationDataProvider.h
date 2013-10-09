//
//  InfusionConfigurationDataProvider.h
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/8/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "CoreDataProvider.h"
#import "DataProviderProtocol.h"

@interface InfusionConfigurationDataProvider : CoreDataProvider <DataProviderProtocol>
+ (InfusionConfigurationDataProvider*)sharedInstance;
- (void)performLoadConfigurationWithFilter:(NSPredicate*)filter delegate:(id<DataProviderDelegate>)delegate userInfo:(id)userInfo;
- (id)switchStateForInfusionID:(NSManagedObjectID*)infusionID;
@end
