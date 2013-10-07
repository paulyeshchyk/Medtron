//
//  NSObject+Localization.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/7/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "NSBundle+Localization.h"

@implementation NSBundle (Localization)
+ (NSString*)localizedStringForKey:(NSString*)key value:(NSString *)value table:(NSString *)tableName inBundle:(NSBundle*)b {
    return [b localizedStringForKey:key value:value table:tableName];
}

@end
