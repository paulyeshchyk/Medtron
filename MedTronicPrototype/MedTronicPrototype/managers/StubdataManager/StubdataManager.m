//
//  StubdataManager.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "StubdataManager.h"
#import "BlogDataProvider.h"
#import "SensorConfigurationDataProvider.h"
#import "SensorDataProvider.h"
#import "SensorTypeDataProvider.h"
#import "SensorTypeDependenceDataProvider.h"
#import "InfusionDataProvider.h"
#import "InfusionConfigurationDataProvider.h"


@implementation StubdataManager

+ (void)performExecution {

    [self blogStubExecution];

    [self sensorExecution];
    
    [self infusionExecution];
    
}

+ (void)sensorExecution {
    
    NSManagedObjectID* sensorType1ID = [[SensorTypeDataProvider sharedInstance] addSensorTypeName:@"My Pump"];
    NSManagedObjectID* sensorType2ID = [[SensorTypeDataProvider sharedInstance] addSensorTypeName:@"My Sensor"];
    NSManagedObjectID* sensorType3ID = [[SensorTypeDataProvider sharedInstance] addSensorTypeName:@"My Infusion Set"];

    id sensor1ID = [[SensorDataProvider sharedInstance] addSensorName:@"MiniMed Paradigm® Revel™" sensorType:sensorType1ID];
    [[SensorDataProvider sharedInstance] addSensorName:@"MiniMed 530G" sensorType:sensorType1ID];
    [[SensorDataProvider sharedInstance] addSensorName:@"SOF-sensor®" sensorType:sensorType2ID];
    id sensor2ID = [[SensorDataProvider sharedInstance] addSensorName:@"Enlite®" sensorType:sensorType2ID];
    [[SensorDataProvider sharedInstance] addSensorName:@"Silhouette®" sensorType:sensorType3ID];
    id sensor3ID = [[SensorDataProvider sharedInstance] addSensorName:@"Quick-set®" sensorType:sensorType3ID];
    [[SensorDataProvider sharedInstance] addSensorName:@"mio®" sensorType:sensorType3ID];
    [[SensorDataProvider sharedInstance] addSensorName:@"Sure-T®" sensorType:sensorType3ID];

    [[SensorConfigurationDataProvider sharedInstance] addConfigurationWithSensorID:sensor1ID andSensorTypeID:sensorType1ID];
    [[SensorConfigurationDataProvider sharedInstance] addConfigurationWithSensorID:sensor2ID andSensorTypeID:sensorType2ID];
    [[SensorConfigurationDataProvider sharedInstance] addConfigurationWithSensorID:sensor3ID andSensorTypeID:sensorType3ID];


}

+ (void)blogStubExecution {
    [[BlogDataProvider sharedInstance] addBlogWithHeadline:@"Lorem1" body:@"ipsum1" author:@"dolores1" image:UIImageJPEGRepresentation ([UIImage imageNamed:@"stub01.jpg"],1.0f)];
    [[BlogDataProvider sharedInstance] addBlogWithHeadline:@"Lorem2" body:@"ipsum2" author:@"dolores2" image:UIImageJPEGRepresentation ([UIImage imageNamed:@"stub02.jpg"],1.0f)];
    [[BlogDataProvider sharedInstance] addBlogWithHeadline:@"Lorem3" body:@"ipsum3" author:@"dolores3" image:UIImageJPEGRepresentation ([UIImage imageNamed:@"stub03.jpg"],1.0f)];
    [[BlogDataProvider sharedInstance] addBlogWithHeadline:@"Lorem4" body:@"ipsum4" author:@"dolores4" image:UIImageJPEGRepresentation ([UIImage imageNamed:@"stub04.jpg"],1.0f)];
    [[BlogDataProvider sharedInstance] addBlogWithHeadline:@"Lorem5" body:@"ipsum5" author:@"dolores5" image:UIImageJPEGRepresentation ([UIImage imageNamed:@"stub05.jpg"],1.0f)];
    [[BlogDataProvider sharedInstance] addBlogWithHeadline:@"Lorem11" body:@"ipsum11" author:@"dolores11" image:UIImageJPEGRepresentation ([UIImage imageNamed:@"stub01.jpg"],1.0f)];
    [[BlogDataProvider sharedInstance] addBlogWithHeadline:@"Lorem12" body:@"ipsum12" author:@"dolores12" image:UIImageJPEGRepresentation ([UIImage imageNamed:@"stub02.jpg"],1.0f)];
    [[BlogDataProvider sharedInstance] addBlogWithHeadline:@"Lorem13" body:@"ipsum13" author:@"dolores13" image:UIImageJPEGRepresentation ([UIImage imageNamed:@"stub03.jpg"],1.0f)];
    [[BlogDataProvider sharedInstance] addBlogWithHeadline:@"Lorem14" body:@"ipsum14" author:@"dolores14" image:UIImageJPEGRepresentation ([UIImage imageNamed:@"stub04.jpg"],1.0f)];
    [[BlogDataProvider sharedInstance] addBlogWithHeadline:@"Lorem15" body:@"ipsum15" author:@"dolores15" image:UIImageJPEGRepresentation ([UIImage imageNamed:@"stub05.jpg"],1.0f)];
    [[BlogDataProvider sharedInstance] addBlogWithHeadline:@"Lorem101" body:@"ipsum101" author:@"dolores101" image:UIImageJPEGRepresentation ([UIImage imageNamed:@"stub01.jpg"],1.0f)];
    [[BlogDataProvider sharedInstance] addBlogWithHeadline:@"Lorem102" body:@"ipsum102" author:@"dolores102" image:UIImageJPEGRepresentation ([UIImage imageNamed:@"stub02.jpg"],1.0f)];
    [[BlogDataProvider sharedInstance] addBlogWithHeadline:@"Lorem103" body:@"ipsum103" author:@"dolores103" image:UIImageJPEGRepresentation ([UIImage imageNamed:@"stub03.jpg"],1.0f)];
    [[BlogDataProvider sharedInstance] addBlogWithHeadline:@"Lorem104" body:@"ipsum104" author:@"dolores104" image:UIImageJPEGRepresentation ([UIImage imageNamed:@"stub04.jpg"],1.0f)];
    [[BlogDataProvider sharedInstance] addBlogWithHeadline:@"Lorem105" body:@"ipsum105" author:@"dolores105" image:UIImageJPEGRepresentation ([UIImage imageNamed:@"stub05.jpg"],1.0f)];
    [[BlogDataProvider sharedInstance] addBlogWithHeadline:@"Lorem111" body:@"ipsum111" author:@"dolores111" image:UIImageJPEGRepresentation ([UIImage imageNamed:@"stub01.jpg"],1.0f)];
    [[BlogDataProvider sharedInstance] addBlogWithHeadline:@"Lorem112" body:@"ipsum112" author:@"dolores112" image:UIImageJPEGRepresentation ([UIImage imageNamed:@"stub02.jpg"],1.0f)];
    [[BlogDataProvider sharedInstance] addBlogWithHeadline:@"Lorem113" body:@"ipsum113" author:@"dolores113" image:UIImageJPEGRepresentation ([UIImage imageNamed:@"stub03.jpg"],1.0f)];
    [[BlogDataProvider sharedInstance] addBlogWithHeadline:@"Lorem114" body:@"ipsum114" author:@"dolores114" image:UIImageJPEGRepresentation ([UIImage imageNamed:@"stub04.jpg"],1.0f)];
    [[BlogDataProvider sharedInstance] addBlogWithHeadline:@"Lorem115" body:@"ipsum115" author:@"dolores115" image:UIImageJPEGRepresentation ([UIImage imageNamed:@"stub05.jpg"],1.0f)];
}

+ (void)infusionExecution {
    NSManagedObjectID* infusionID = nil;
    infusionID = [[InfusionDataProvider sharedInstance] addInfusionName:@"my Infusion Set"];
    [[InfusionConfigurationDataProvider sharedInstance] switchStateForInfusionID:infusionID];

    infusionID = [[InfusionDataProvider sharedInstance] addInfusionName:@"Using the Bolus Wizard® Feature"];
    [[InfusionConfigurationDataProvider sharedInstance] switchStateForInfusionID:infusionID];

    infusionID = [[InfusionDataProvider sharedInstance] addInfusionName:@"Inserting The Sensor"];

    infusionID = [[InfusionDataProvider sharedInstance] addInfusionName:@"Programming a Single Basal Rate"];
    
    infusionID = [[InfusionDataProvider sharedInstance] addInfusionName:@"Setting Temporary Basal Rates"];
    [[InfusionConfigurationDataProvider sharedInstance] switchStateForInfusionID:infusionID];
    
    infusionID = [[InfusionDataProvider sharedInstance] addInfusionName:@"Square Wave®"];
    infusionID = [[InfusionDataProvider sharedInstance] addInfusionName:@"Dual Wave®"];
}

@end
