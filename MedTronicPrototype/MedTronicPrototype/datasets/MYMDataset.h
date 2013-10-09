//
//  MYMDataset.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/10/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MYMDataset;

@protocol MYMDatasetDelegate <NSObject>
@optional
- (void)willStartLoadDataset:(MYMDataset*)dataset;
- (void)didEndLoadDataset:(MYMDataset*)dataset;
@end

@interface MYMDataset : NSObject

@property (nonatomic, weak)id<MYMDatasetDelegate> delegate;

- (void)willStartLoad;
- (void)hasFinishedLoad;
@end
