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
- (id)datasetInfusion;
- (id)infusionAtIndexPath:(NSIndexPath*)indexPath;
- (id)infusionAtIndex:(NSInteger)index;
- (BOOL)isInfusionConfigured:(id)infusionID;
- (BOOL)isInfusionConfiguredAtIndexPath:(NSIndexPath*)indexPath;
- (id)datasetInfusionConfiguration;
- (void)makeConfigurationForInfusion:(id)infusion;
- (void)makeConfigurationForInfusionAtIndexPath:(NSIndexPath*)indexPath;
@end

@protocol InfusionSelectorViewProtocol <NSObject>
@required
- (void)reloadView;
@property (nonatomic, weak)id<InfusionSelectorViewDatasource>datasource;
@end
