//
//  PumpSettingTypesDataProvider.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/10/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "PumpSettingTypesDataProvider.h"

@implementation PumpSettingTypesDataProvider
static PumpSettingTypesDataProvider *sharedInstance_ = nil;

+ (PumpSettingTypesDataProvider*)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance_ = [[self alloc] init];
    });
    return sharedInstance_;
}

- (NSString*)entityName {
    return kPumpSettingTypeEntity;
}
@end
