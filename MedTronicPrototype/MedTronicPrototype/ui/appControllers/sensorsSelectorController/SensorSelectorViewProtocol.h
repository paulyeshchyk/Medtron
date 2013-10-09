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
- (NSString*)sensorNameAtSection:(NSInteger)section andRow:(NSInteger)row;
- (BOOL)isSensorConfiguredAtSection:(NSInteger)section andRow:(NSInteger)row;
- (NSInteger)sensorTypeCount;
- (NSString*)sensorTypeNameAtIndex:(NSInteger)index;
- (void)addConfigurationForSection:(NSInteger)section andRow:(NSInteger)row;
- (NSInteger)sensorsCountAtSection:(NSInteger)section;
@end

@protocol SensorSelectorViewProtocol <NSObject>
@required
- (void)reloadView;
@property (nonatomic, assign)id<SensorSelectorViewDatasource>datasource;
@end
