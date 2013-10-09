//
//  MYMInfusionObject.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/10/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYMInfusionObject : NSObject
@property (nonatomic, strong)NSString* name;
@property (nonatomic, assign)BOOL configured;
@property (nonatomic, strong)NSManagedObjectID* managedObjectID;
@end
