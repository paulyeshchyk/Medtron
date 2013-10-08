//
//  SensorConfigurationComplexDataProvider.h
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/8/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "CoreDataProvider.h"
#import "DataProviderProtocol.h"

@interface SensorConfigurationComplexDataProvider : CoreDataProvider <DataProviderProtocol>
- (void)loadConfiguration;
@end
