//
//  NSObject+Localization.h
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/7/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#define LocalizedString(key, comment) \
[NSBundle localizedStringForKey:(key) value:@"" table:nil inBundle:[NSBundle mainBundle]]
#define LocalizedStringFromTable(key, tbl, comment) \
[NSBundle localizedStringForKey:(key) value:@"" table:(tbl) inBundle:[NSBundle mainBundle]]
#define LocalizedStringFromTableInBundle(key, tbl, bundle, comment) \
[NSBundle localizedStringForKey:(key) value:@"" table:(tbl) inBundle:(bundle)]
#define LocalizedStringWithDefaultValue(key, tbl, bundle, val, comment) \
[NSBundle localizedStringForKey:(key) value:(val) table:(tbl) inBundle:(bundle)]

@interface NSBundle (Localization)
+ (NSString*)localizedStringForKey:(NSString*)key value:(NSString *)value table:(NSString *)tableName inBundle:(NSBundle*)b;
@end
