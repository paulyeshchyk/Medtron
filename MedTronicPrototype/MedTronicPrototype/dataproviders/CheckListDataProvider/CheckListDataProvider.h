//
//  CheckListDataProvider.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/10/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "CoreDataProvider.h"
#import "DataProviderProtocol.h"

@interface CheckListDataProvider : CoreDataProvider <DataProviderProtocol>
- (id)addCheckListName:(NSString*)sensorTypeName;
- (void)performLoadCheckListWithFilter:(NSPredicate*)filter delegate:(id<DataProviderDelegate>)delegate userInfo:(id)userInfo;
@end
