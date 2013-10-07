//
//  ApplicationCommand.h
//  MedTronicPrototype
//
//  Created by Pavel on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ApplicationCommand <NSObject>
@required
- (NSInteger)executeWithArgs:(NSDictionary*)args;
@end


static NSString* const kCommandArgmentNameBlogID = @"kCommandArgmentNameBlogID";