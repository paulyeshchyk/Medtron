//
//  RemindersDataProvider.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/10/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "RemindersDataProvider.h"

@implementation RemindersDataProvider
static RemindersDataProvider *sharedInstance_ = nil;

+ (RemindersDataProvider*)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance_ = [[self alloc] init];
    });
    return sharedInstance_;
}

- (NSString*)entityName {
    return kReminderEntity;
}
@end
