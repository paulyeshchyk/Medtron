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
- (id)datasetSensorType;
- (BOOL)isSensorConfigured:(id)sensorID;
- (void)makeConfigurationForSensor:(id)sensor andSensorType:(id)sensorType;
@end

@protocol SensorSelectorViewProtocol <NSObject>
@required
- (void)reloadView;
@property (nonatomic, assign)id<SensorSelectorViewDatasource>datasource;
@end
