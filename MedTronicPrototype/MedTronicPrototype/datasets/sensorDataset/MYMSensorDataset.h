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
- (BOOL)isSensorConfiguredAtSection:(NSInteger)section andRow:(NSInteger)row;
- (NSString*)sensorNameAtSection:(NSInteger)section andRow:(NSInteger)row;
- (NSString*)sensorTypeNameAtIndex:(NSInteger)index;
- (void)addConfigurationForSection:(NSInteger)section andRow:(NSInteger)row;

@end
