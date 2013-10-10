//
//  Reminder.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/10/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ReminderType;

@interface Reminder : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * isSwitched;
@property (nonatomic, retain) NSString * userInfo;
@property (nonatomic, retain) ReminderType *reminderType;

@end
