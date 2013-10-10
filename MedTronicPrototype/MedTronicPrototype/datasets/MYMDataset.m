//
//  MYMDataset.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/10/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMDataset.h"

@interface MYMDataset(){
}
@end;

@implementation MYMDataset
@synthesize delegate;


- (void)willStartLoad {
    if ([self.delegate respondsToSelector:@selector(willStartLoadDataset:)]) {
        [delegate willStartLoadDataset:self];
    }
}

- (void)hasFinishedLoad {
    if ([self.delegate respondsToSelector:@selector(didEndLoadDataset:)]) {
        [delegate didEndLoadDataset:self];
    }
}

@end
