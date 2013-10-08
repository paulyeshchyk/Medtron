//
//  InfusionConfigurationEntity.h
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/8/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class InfusionEntity;

@interface InfusionConfigurationEntity : NSManagedObject

@property (nonatomic, retain) NSNumber * checked;
@property (nonatomic, retain) InfusionEntity *infusion;

@end
