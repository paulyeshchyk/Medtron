//
//  MYMDatasetProtocol.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/9/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol MYMDatasetProtocol;


@protocol MYMDatasetProtocol <NSObject>

@required
- (void)saveChanges;
- (void)rollback;
- (void)reloadData;
- (NSInteger)sectionsCount;
- (id)sectionAtIndex:(NSInteger)index;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (id)objectAtIndexPath:(NSIndexPath*)indexPath;

@end
