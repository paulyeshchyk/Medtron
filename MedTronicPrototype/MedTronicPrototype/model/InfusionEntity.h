//
//  InfusionEntity.h
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/8/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class InfusionConfigurationEntity;

@interface InfusionEntity : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) InfusionConfigurationEntity *configuraton;

@end