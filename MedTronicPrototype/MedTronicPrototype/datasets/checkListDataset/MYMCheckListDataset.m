//
//  MYMCheckListDataset.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMCheckListDataset.h"
#import "CheckListDataProvider.h"
#import "DataProviderProtocol.h"
#import "CheckListEntity.h"

@interface MYMCheckListDataset()<DataProviderDelegate>{
    NSMutableArray* data_;
}
@end

@implementation MYMCheckListDataset

- (void)saveChanges {
    NSError* error = [[CheckListDataProvider sharedInstance] saveContext];
    if (error){
        NSLog(@"%@",error.localizedDescription);
    }
}

- (void)rollback {
    [[CheckListDataProvider sharedInstance] rollback];
}

- (void)reloadData {
    [self willStartLoad];
    
    data_ = nil;

    [[CheckListDataProvider sharedInstance] performLoadCheckListWithFilter:nil delegate:self userInfo:nil];
}

- (NSInteger)sectionsCount {
    return 1;
}

- (id)sectionAtIndex:(NSInteger)index {
    return nil;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return [data_ count];
}

- (id)objectAtIndexPath:(NSIndexPath*)indexPath {
    return [data_ objectAtIndex:indexPath.row];
}

- (void)deleteObjectsAtIndexPaths:(NSArray*)indexPaths {
    //FIXME:check
    for(NSIndexPath* indexPath in indexPaths) {
        [[CheckListDataProvider sharedInstance] removeObject:[self objectAtIndexPath:indexPath]];
        [data_ removeObjectAtIndex:indexPath.row];
    }
}

#pragma mark - DataProviderProtocol
- (void)provider:(id)dataprovider didFinishExecuteFetchWithResult:(NSArray*)resultArray andError:(NSError*)error userInfo:(id)userInfo {
    data_ = [NSMutableArray arrayWithArray:resultArray];

    [self hasFinishedLoad];
}

#pragma mark -
- (void)addCheckListItemWithName:(NSString*)name callback:(MYMCheckListDatasetAddCallback)callback {
    [[CheckListDataProvider sharedInstance] addCheckListName:name];
    [[CheckListDataProvider sharedInstance] saveContext];
    if (callback != NULL){
        callback();
    }
}

- (void)switchCheckmarkForItemAtIndexPath:(NSIndexPath*)indexPath {
    CheckListEntity* entity = [data_ objectAtIndex:indexPath.row];
    entity.checked = [NSNumber numberWithBool:![entity.checked boolValue]];
}

- (NSString*)checkListItemNameAtIndexPath:(NSIndexPath*)indexPath {
    CheckListEntity* entity = [data_ objectAtIndex:indexPath.row];
    return [entity name];
}

- (BOOL)checkListItemCheckedStateAtIndexPath:(NSIndexPath*)indexPath {
    CheckListEntity* entity = [data_ objectAtIndex:indexPath.row];
    return [[entity checked] boolValue];
}

- (void)makeAllItemsUnchecked {
    
    for(CheckListEntity* obj in data_) {
        obj.checked = [NSNumber numberWithBool:NO];
    }
    
}
@end
