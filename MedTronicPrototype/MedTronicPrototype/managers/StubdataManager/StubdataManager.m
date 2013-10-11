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
#import "MYMAlarmDataProvider.h"
#import "MYMAlarmTypeDataProvider.h"
#import "CheckListDataProvider.h"
#import "TipsDataProvider.h"


@implementation StubdataManager

+ (void)performExecution {

    [self blogStubExecution];

    [self sensorExecution];
    
    [self infusionExecution];
    
    [self alarmsExecution];
    
    [self checkListExecution];
    
    [self tipsExecution];
    
}

+ (void)alarmsExecution {
    NSManagedObjectID* alarmType1ID = [[MYMAlarmTypeDataProvider sharedInstance] addAlarmTypeWithName:@"Pump Alarms"];
    NSManagedObjectID* alarmType2ID = [[MYMAlarmTypeDataProvider sharedInstance] addAlarmTypeWithName:@"Sensor Alarms"];

    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Low Batery" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType1ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Low Reservoir" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType1ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"A (Alarm)" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType1ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Auto Off" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType1ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Batt Out Limit" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType1ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Bolus Stopped" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType1ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Button Error" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType1ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Check Settings" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType1ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"E (Error)" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType1ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Empty Reservoir" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType1ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Failed Batt Test" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType1ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Finish Loading" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType1ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Is Priming Complete" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType1ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Max Delivery" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType1ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Max Fill Reached" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType1ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Motor Error" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType1ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"No Delivery" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType1ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"No Reservoir" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType1ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Off No Power" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType1ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Reset" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType1ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Weak Battery" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType1ID];
    

    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Alert Silence" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType2ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Bad Sensor" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType2ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Bad Transmtr" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType2ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Cal Error" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType2ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Change Sensor" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType2ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Charge Transmtr" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType2ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Fall Rate" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType2ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"High Predicted" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType2ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"High XXX MG/DL" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType2ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Lost Sensor" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType2ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Low Predicted" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType2ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Low Transmtr" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType2ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Low XXX MG/DL" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType2ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Meter BG By XX:XX" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType2ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Meter BG Now" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType2ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Rise Rate" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType2ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Sensor End" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType2ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Sensor Error" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType2ID];
    [[MYMAlarmDataProvider sharedInstance] addAlarmWithName:@"Weak Signal" andExplanation:@"no explanation yet" andAlarmTypeID:alarmType2ID];

    [[MYMAlarmTypeDataProvider sharedInstance] saveContext];
    [[MYMAlarmDataProvider sharedInstance] saveContext];

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

    
    [[SensorTypeDataProvider sharedInstance] saveContext];
    [[SensorDataProvider sharedInstance] saveContext];
    [[SensorConfigurationDataProvider sharedInstance] saveContext];
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
    [[BlogDataProvider sharedInstance] saveContext];
}

+ (void)infusionExecution {
    NSManagedObjectID* infusionID1 = [[InfusionDataProvider sharedInstance] addInfusionName:@"my Infusion Set"];
    NSManagedObjectID* infusionID2 = [[InfusionDataProvider sharedInstance] addInfusionName:@"Using the Bolus Wizard® Feature"];
    [[InfusionDataProvider sharedInstance] addInfusionName:@"Inserting The Sensor"];
    [[InfusionDataProvider sharedInstance] addInfusionName:@"Programming a Single Basal Rate"];
    NSManagedObjectID* infusionID5 = [[InfusionDataProvider sharedInstance] addInfusionName:@"Setting Temporary Basal Rates"];
    [[InfusionDataProvider sharedInstance] addInfusionName:@"Square Wave®"];
    [[InfusionDataProvider sharedInstance] addInfusionName:@"Dual Wave®"];

    [[InfusionConfigurationDataProvider sharedInstance] switchStateForInfusionID:infusionID1];
    [[InfusionConfigurationDataProvider sharedInstance] switchStateForInfusionID:infusionID2];
    [[InfusionConfigurationDataProvider sharedInstance] switchStateForInfusionID:infusionID5];

    [[InfusionDataProvider sharedInstance] saveContext];
    [[InfusionConfigurationDataProvider sharedInstance] saveContext];
}

+ (void)checkListExecution {
    [[CheckListDataProvider sharedInstance] addCheckListName:@"Blood glucose meter" ];
    [[CheckListDataProvider sharedInstance] addCheckListName:@"Test strips and lancets" ];
    [[CheckListDataProvider sharedInstance] addCheckListName:@"Glucose tablets or fast acting sugar" ];
    [[CheckListDataProvider sharedInstance] addCheckListName:@"Snacks" ];
    [[CheckListDataProvider sharedInstance] addCheckListName:@"Glucagon Emergency Kit" ];
    [[CheckListDataProvider sharedInstance] addCheckListName:@"Ketone strips" ];
    [[CheckListDataProvider sharedInstance] addCheckListName:@"Medical ID" ];
    
}

+ (void)tipsExecution {
    [[TipsDataProvider sharedInstance] addTipWithName:@"Travel Loaner Program" explanation:@"Lorem ipsum" explanationURL:nil];
    [[TipsDataProvider sharedInstance] addTipWithName:@"Airport Security" explanation:@"Lorem ipsum" explanationURL:nil];
    [[TipsDataProvider sharedInstance] addTipWithName:@"Using Device on an Airplane" explanation:@"Lorem ipsum" explanationURL:nil];
    [[TipsDataProvider sharedInstance] addTipWithName:@"Support Outside the U.S" explanation:@"Lorem ipsum" explanationURL:@"www.google.com"];
    [[TipsDataProvider sharedInstance] addTipWithName:@"Updating for Time Zone Changes" explanation:@"Lorem ipsum" explanationURL:nil];
    
}

@end
