//
//  UITableViewCell+CustomLocalization.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/7/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "UITableViewCell+CustomLocalization.h"

@implementation UITableViewCell (CustomLocalization)
- (void)awakeFromNib {
    IMP impOfCalling = [self impOf:self selector:_cmd];
    IMP superSequentImp = [self impOf:_cmd after:impOfCalling];
    ((void(*)(id, SEL))superSequentImp)(self, _cmd);
//    self.text = LocalizedString(self.text, nil);
}

@end
