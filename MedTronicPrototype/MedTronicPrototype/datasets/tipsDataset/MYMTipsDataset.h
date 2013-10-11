//
//  MYMTipsDataset.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/12/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMDataset.h"
#import "MYMDatasetProtocol.h"

@interface MYMTipsDataset : MYMDataset<MYMDatasetProtocol>

- (NSString*)tipNameAtIndexPath:(NSIndexPath*)indexPath;
- (NSString*)tipExplanationAtIndexPath:(NSIndexPath*)indexPath;
- (NSString*)tipExplanationURLAtIndexPath:(NSIndexPath*)indexPath;
@end
