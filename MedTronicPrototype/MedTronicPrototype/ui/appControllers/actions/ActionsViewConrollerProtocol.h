//
//  ActionsViewConrollerProtocol.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ActionsViewConrollerProtocol
@required
- (void)reloadActionSheet;
@end

@protocol ActionsViewConrollerDatasource
@required
- (NSString*)blogsHeadline;
@end
