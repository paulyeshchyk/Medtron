//
//  RemindersTypeDataProvider.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/10/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "RemindersTypeDataProvider.h"

@implementation RemindersTypeDataProvider
static RemindersTypeDataProvider *sharedInstance_ = nil;

+ (RemindersTypeDataProvider*)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance_ = [[self alloc] init];
    });
    return sharedInstance_;
}

- (NSString*)entityName {
    return kReminderTypeEntity;
}
@end
