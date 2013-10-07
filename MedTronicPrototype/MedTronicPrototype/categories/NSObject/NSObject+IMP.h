//
//  NSObject+IMP.h
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/7/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (IMP)
- (IMP)impOf:(SEL)lookup after:(IMP)skip;
- (IMP)impOf:(id)lookupObject selector:(SEL)selector;
@end
