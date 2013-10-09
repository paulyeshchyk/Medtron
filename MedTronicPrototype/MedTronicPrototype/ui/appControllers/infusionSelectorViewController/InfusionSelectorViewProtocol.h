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
- (void)switchStateForInfusionAtSection:(NSInteger)section andRow:(NSInteger)row;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (BOOL)isInfusionConfiguredAtSection:(NSInteger)section andRow:(NSInteger)row;
- (NSString*)infusionNameAtSection:(NSInteger)section andRow:(NSInteger)row;
@end

@protocol InfusionSelectorViewProtocol <NSObject>
@required
- (void)reloadView;
@property (nonatomic, weak)id<InfusionSelectorViewDatasource>datasource;
@end
