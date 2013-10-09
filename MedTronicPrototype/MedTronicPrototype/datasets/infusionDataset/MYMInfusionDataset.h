//
//  MYMInfusionDataset.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/9/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMDatasetProtocol.h"
#import "MYMDataset.h"

@interface MYMInfusionDataset : MYMDataset <MYMDatasetProtocol>
- (void)switchStateForInfusionAtSection:(NSInteger)section andRow:(NSInteger)row;
- (BOOL)isInfusionConfiguredAtSection:(NSInteger)section andRow:(NSInteger)row;
- (NSString*)infusionNameAtSection:(NSInteger)section andRow:(NSInteger)row;
@end
