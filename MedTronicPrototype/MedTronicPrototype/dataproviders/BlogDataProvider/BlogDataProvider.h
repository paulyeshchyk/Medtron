//
//  BlogDataProvider.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/5/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataProviderProtocol.h"
#import "CoreDataProvider.h"

@interface BlogDataProvider : CoreDataProvider <DataProviderProtocol>
+ (BlogDataProvider*)sharedInstance;
- (NSUInteger)blogsCountWithFilter:(id)filter;
- (id)addBlogWithHeadline:(NSString*)headline body:(NSString*)body author:(NSString*)author image:(NSData*)image;
- (void)performLoadBlogsWithFilter:(NSPredicate*)filter delegate:(id<DataProviderDelegate>)delegate userInfo:(id)userInfo;
@end
