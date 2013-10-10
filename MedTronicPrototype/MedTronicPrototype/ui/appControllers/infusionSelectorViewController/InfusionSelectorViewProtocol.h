//
//  InfusionSelectorViewProtocol.h
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/9/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol InfusionSelectorViewDatasource
@required
- (NSInteger)numberOfSections;
- (NSString*)sectionNameAtIndex:(NSInteger)index;
- (void)switchStateForInfusionAtIndexPath:(NSIndexPath*)indexPath;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (BOOL)isInfusionConfiguredAtIndexPath:(NSIndexPath*)indexPath;
- (NSString*)infusionNameAtIndexPath:(NSIndexPath*)indexPath;
@end

@protocol InfusionSelectorViewProtocol <NSObject>
@required
- (void)reloadView;
@property (nonatomic, weak)id<InfusionSelectorViewDatasource>datasource;
@end
