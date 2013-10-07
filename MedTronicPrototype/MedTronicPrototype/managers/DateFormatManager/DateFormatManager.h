//
//  DateFormatManager.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateFormatManager : NSObject
+ (DateFormatManager*)sharedInstance;
+ (NSDateFormatter*)formatterWithPattern:(NSString*)pattern;
@end
