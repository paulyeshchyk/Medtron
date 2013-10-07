//
//  NSObject+IMP.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/7/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "NSObject+IMP.h"
#import <objc/runtime.h>

@implementation NSObject (IMP)

- (IMP)impOf:(id)lookupObject selector:(SEL)selector {
    NSUInteger returnAddress = (NSUInteger)__builtin_return_address (0);
    NSUInteger closest = 0;
    
    // Iterate over the class and all superclasses
    Class currentClass = object_getClass (lookupObject);
    while (currentClass) {
        // Iterate over all instance methods for this class
        unsigned int methodCount;
        Method* methodList = class_copyMethodList (currentClass, &methodCount);
        unsigned int i;
        for (i = 0; i < methodCount; i++) {
            // Ignore methods with different selectors
            if (method_getName (methodList[i]) != selector) {
                continue;
            }
            
            // If this address is closer, use it instead
            NSUInteger address = (NSUInteger)method_getImplementation (methodList[i]);
            if (address < returnAddress && address > closest) {
                closest = address;
            }
        }
        
        free (methodList);
        currentClass = class_getSuperclass (currentClass);
    }
    
    return (IMP)closest;
}

- (IMP)impOf:(SEL)lookup after:(IMP)skip {
    BOOL found = NO;
    
    Class currentClass = object_getClass (self);
    while (currentClass) {
        // Get the list of methods for this class
        unsigned int methodCount;
        Method* methodList = class_copyMethodList (currentClass, &methodCount);
        
        // Iterate over all methods
        unsigned int i;
        for (i = 0; i < methodCount; i++) {
            // Look for the selector
            if (method_getName (methodList[i]) != lookup) {
                continue;
            }
            
            IMP implementation = method_getImplementation (methodList[i]);
            
            // Check if this is the "skip" implementation
            if (implementation == skip) {
                found = YES;
            } else if (found)   {
                // Return the match.
                free (methodList);
                return implementation;
            }
        }
        
        // No match found. Traverse up through super class' methods.
        free (methodList);
        
        currentClass = class_getSuperclass (currentClass);
    }
    return nil;
}

@end
