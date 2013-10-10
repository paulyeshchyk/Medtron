//
//  MYMSensorDataset.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/10/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMDatasetProtocol.h"
#import "MYMDataset.h"

@interface MYMSensorDataset : MYMDataset<MYMDatasetProtocol>
- (BOOL)isSensorConfiguredAtIndexPath:(NSIndexPath*)indexPath;
- (NSString*)sensorNameAtIndexPath:(NSIndexPath*)indexPath;
- (NSString*)sensorTypeNameAtIndex:(NSInteger)index;
- (void)addConfigurationForIndexPath:(NSIndexPath*)indexPath;

@end
