//
//  PumpSettingsDataProvider.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/10/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "PumpSettingsDataProvider.h"

@implementation PumpSettingsDataProvider
static PumpSettingsDataProvider *sharedInstance_ = nil;

+ (PumpSettingsDataProvider*)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance_ = [[self alloc] init];
    });
    return sharedInstance_;
}

- (NSString*)entityName {
    return kPumpSettingEntity;
}
@end
