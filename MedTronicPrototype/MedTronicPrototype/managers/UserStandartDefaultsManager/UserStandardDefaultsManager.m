//
//  UserStandardDefaultsManager.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "UserStandardDefaultsManager.h"

@implementation UserStandardDefaultsManager

static UserStandardDefaultsManager *sharedInstance_ = nil;

+ (UserStandardDefaultsManager*)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance_ = [[self alloc] init];
    });
    return sharedInstance_;
}

- (BOOL)userHasReadTerms {
    return [[[NSUserDefaults standardUserDefaults] valueForKey:kStandartUserDefaultsTermsHasRead] boolValue];
}

- (void)setUserHasReadTerms:(BOOL)value {
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:value] forKey:kStandartUserDefaultsTermsHasRead];
    [[NSUserDefaults standardUserDefaults] synchronize];

}


@end
