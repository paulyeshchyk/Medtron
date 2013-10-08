//
//  CellAccessorsFabric.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/7/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "CellAccessorsFabric.h"

@implementation CellAccessorsFabric

+ (UIButton*)accessorSolidCheckmarkOnWithTarget:(id)target action:(SEL)action{
    UIButton* result = [UIButton buttonWithType:UIButtonTypeCustom];
    [result setImage:[UIImage imageNamed:@"CheckBoxOn.png"] forState:UIControlStateNormal];
    [result addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return result;
}

+ (UIButton*)accessorSolidCheckmarkOffWithTarget:(id)target action:(SEL)action{
    UIButton* result = [UIButton buttonWithType:UIButtonTypeCustom];
    [result setImage:[UIImage imageNamed:@"CheckBoxOff.png"] forState:UIControlStateNormal];
    [result addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return result;
}
@end
