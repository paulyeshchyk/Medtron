//
//  UserStandardDefaultsManager.h
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString* const kStandartUserDefaultsTermsHasRead = @"kStandartUserDefaultsTermsHasRead";


@interface UserStandardDefaultsManager : NSObject
+ (UserStandardDefaultsManager*)sharedInstance;
- (BOOL)userHasReadTerms;
- (void)setUserHasReadTerms:(BOOL)value;
@end
