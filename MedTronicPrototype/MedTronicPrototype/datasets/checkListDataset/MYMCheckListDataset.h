//
//  MYMCheckListDataset.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMDataset.h"
#import "MYMDatasetProtocol.h"

typedef void(^MYMCheckListDatasetAddCallback)();

@interface MYMCheckListDataset : MYMDataset <MYMDatasetProtocol>
- (void)addCheckListItemWithName:(NSString*)name callback:(MYMCheckListDatasetAddCallback)callback;
- (void)switchCheckmarkForItemAtIndexPath:(NSIndexPath*)indexPath;
- (NSString*)checkListItemNameAtIndexPath:(NSIndexPath*)indexPath;
- (BOOL)checkListItemCheckedStateAtIndexPath:(NSIndexPath*)indexPath;
- (void)makeAllItemsUnchecked;
@end
