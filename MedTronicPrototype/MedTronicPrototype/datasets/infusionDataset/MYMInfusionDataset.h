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
- (void)switchStateForInfusionAtIndexPath:(NSIndexPath*)indexPath;
- (BOOL)isInfusionConfiguredAtIndexPath:(NSIndexPath*)indexPath;
- (NSString*)infusionNameAtIndexPath:(NSIndexPath*)indexPath;
@end
