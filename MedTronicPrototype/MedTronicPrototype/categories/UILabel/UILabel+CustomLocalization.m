//
//  UILabel+CustomLocalization.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/7/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "UILabel+CustomLocalization.h"
#import <objc/runtime.h>
#import <objc/message.h>

static void *kUILabelCustomLocalizationLocalizedKey;


@implementation UILabel (CustomLocalization)

@dynamic localized;

- (void)awakeFromNib {
    IMP impOfCalling = [self impOf:self selector:_cmd];
    IMP superSequentImp = [self impOf:_cmd after:impOfCalling];
    ((void(*)(id, SEL))superSequentImp)(self, _cmd);
    self.text = LocalizedString(self.text, nil);
}

- (void)setLocalized:(BOOL)localized {
    objc_setAssociatedObject(self, kUILabelCustomLocalizationLocalizedKey, [NSNumber numberWithBool:localized], OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)localized {
    return [objc_getAssociatedObject(self, kUILabelCustomLocalizationLocalizedKey) boolValue];
}




@end
