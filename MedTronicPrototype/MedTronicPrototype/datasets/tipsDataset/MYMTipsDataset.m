//
//  MYMTipsDataset.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/12/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMTipsDataset.h"
#import "TipEntity.h"
#import "TipsDataProvider.h"

@interface MYMTipsDataset() <DataProviderDelegate>{
    NSMutableArray* data_;
}
@end

@implementation MYMTipsDataset

- (void)saveChanges {
    NSError* error = [[TipsDataProvider sharedInstance] saveContext];
    if (error){
        NSLog(@"%@",error.localizedDescription);
    }
}

- (void)rollback {
    [[TipsDataProvider sharedInstance] rollback];
}

- (void)reloadData {
    [self willStartLoad];
    
    data_ = nil;
    
    [[TipsDataProvider sharedInstance] performLoadTipsWithFilter:nil delegate:self userInfo:nil];
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
        [[TipsDataProvider sharedInstance] removeObject:[self objectAtIndexPath:indexPath]];
        [data_ removeObjectAtIndex:indexPath.row];
    }
}

#pragma mark - DataProviderProtocol
- (void)provider:(id)dataprovider didFinishExecuteFetchWithResult:(NSArray*)resultArray andError:(NSError*)error userInfo:(id)userInfo {
    data_ = [NSMutableArray arrayWithArray:resultArray];
    
    [self hasFinishedLoad];
}

- (NSString*)tipNameAtIndexPath:(NSIndexPath*)indexPath {
    TipEntity* entity = [data_ objectAtIndex:indexPath.row];
    return [entity name];
}

- (NSString*)tipExplanationAtIndexPath:(NSIndexPath*)indexPath {
    TipEntity* entity = [data_ objectAtIndex:indexPath.row];
    return [entity explanation];
}

- (NSString*)tipExplanationURLAtIndexPath:(NSIndexPath*)indexPath {
    TipEntity* entity = [data_ objectAtIndex:indexPath.row];
    return [entity explanationURL];
}

@end
