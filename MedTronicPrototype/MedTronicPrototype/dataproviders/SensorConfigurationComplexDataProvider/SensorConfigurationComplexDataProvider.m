//
//  SensorConfigurationComplexDataProvider.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/8/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "SensorConfigurationComplexDataProvider.h"
#import "SensorTypeDataProvider.h"
#import "SensorConfigurationDataProvider.h"

static NSString* const kDatasetNameSensorType = @"sensorType";
static NSString* const kDatasetNameSensorConfiguration = @"sensorConfiguration";
static NSString* const kDatasetNameSensor = @"sensor";

@interface SensorConfigurationComplexDataProvider () <DataProviderDelegate>{
    NSUInteger providersExecutionCount_;
    NSMutableDictionary* resultset_;
}
@end

@implementation SensorConfigurationComplexDataProvider

- (void)loadConfiguration {
    resultset_ = [NSMutableDictionary new];
    
    providersExecutionCount_ = 0;
    [[SensorTypeDataProvider sharedInstance] performLoadSensorTypesWithFilter:nil delegate:self userInfo:kDatasetNameSensorType];
    [[SensorConfigurationDataProvider sharedInstance] performLoadConfigurationWithFilter:nil delegate:self userInfo:kDatasetNameSensorConfiguration];
}


#pragma mark - DataProviderDelegate
- (void)provider:(id)dataprovider didFinishExecuteFetchWithResult:(NSArray*)resultArray andError:(NSError*)error userInfo:(id)userInfo {
    [resultset_ setObject:resultArray forKey:userInfo];
    
    providersExecutionCount_++;
    if (providersExecutionCount_ == 2) {
//        [delegate provider:self didFinishExecuteFetchWithResult:nil andError:nil userInfo:nil];

    }
}

@end
