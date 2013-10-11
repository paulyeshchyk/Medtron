//
//  TipsDataProvider.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/12/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "CoreDataProvider.h"
#import "DataProviderProtocol.h"

@interface TipsDataProvider : CoreDataProvider <DataProviderProtocol>
+ (TipsDataProvider*)sharedInstance;
- (NSUInteger)tipsCountWithFilter:(id)filter;
- (id)addTipWithName:(NSString*)name explanation:(NSString*)explanation explanationURL:(NSString*)explanationURL;
- (void)performLoadTipsWithFilter:(NSPredicate*)filter delegate:(id<DataProviderDelegate>)delegate userInfo:(id)userInfo;
@end
