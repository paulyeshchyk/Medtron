//
//  BlogDescriptionViewControllerProtocol.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BlogDescriptionViewControllerDatasource <NSObject>
@required
- (id)blogsDescription;
@end

@protocol BlogDescriptionViewControllerProtocol <NSObject>
@required
- (void)reloadDescription;
@end
