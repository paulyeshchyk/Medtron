//
//  TipEntity.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/12/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TipEntity : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * explanation;
@property (nonatomic, retain) NSString * explanationURL;

@end
