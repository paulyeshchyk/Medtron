//
//  SensorSelectorViewProtocol.h
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/9/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol SensorSelectorViewDatasource
@required
- (id)sensorTypeAtIndex:(NSInteger)index;
- (id)sensorAtIndexPath:(NSIndexPath*)indexPath;
- (NSString*)sensorNameAtIndexPath:(NSIndexPath*)indexPath;
- (BOOL)isSensorConfiguredAtIndexPath:(NSIndexPath*)indexPath;
- (NSInteger)sensorTypeCount;
- (NSString*)sensorTypeNameAtIndex:(NSInteger)index;
- (void)addConfigurationForIndexPath:(NSIndexPath*)indexPath;
- (NSInteger)sensorsCountAtSection:(NSInteger)section;
@end

@protocol SensorSelectorViewProtocol <NSObject>
@required
- (void)reloadView;
@property (nonatomic, assign)id<SensorSelectorViewDatasource>datasource;
@end
