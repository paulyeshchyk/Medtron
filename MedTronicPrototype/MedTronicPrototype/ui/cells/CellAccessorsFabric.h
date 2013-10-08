//
//  CellAccessorsFabric.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/7/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellAccessorsFabric : NSObject
+ (UIButton*)accessorSolidCheckmarkOnWithTarget:(id)target action:(SEL)action;
+ (UIButton*)accessorSolidCheckmarkOffWithTarget:(id)target action:(SEL)action;
@end
