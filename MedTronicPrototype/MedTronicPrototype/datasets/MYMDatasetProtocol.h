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
- (void)reloadData;
- (NSInteger)sectionsCount;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (id)sectionAtIndex:(NSInteger)index;
- (id)objectAtSection:(NSInteger)section andRow:(NSInteger)row;

@end
