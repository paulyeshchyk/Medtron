//
//  BlogDataProvider.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/5/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "BlogEntity.h"
#import "BlogDataProvider.h"
#import "coredata_model_definitions.h"

@interface BlogDataProvider(){
}
@end

@implementation BlogDataProvider

static BlogDataProvider *sharedInstance_ = nil;

+ (BlogDataProvider*)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance_ = [[self alloc] init];
    });
    return sharedInstance_;
}

- (NSString*)entityName {
    return kBlogEntity;
}

- (id)addBlogWithHeadline:(NSString*)headline body:(NSString*)body author:(NSString*)author image:(NSData*)image{
    BlogEntity* entity = [self newEntity];
    entity.headline = headline;
    entity.body = body;
    entity.author = author;
    entity.created = [NSDate date];
    entity.image = image;

    return [entity objectID];
}

- (NSUInteger)blogsCountWithFilter:(id)filter {

    NSPredicate* predicate = nil;
    NSError* error = nil;
    return [self itemsCountForPredicate:predicate error:&error];
    
}

- (void)performLoadBlogsWithFilter:(NSPredicate*)filter delegate:(id<DataProviderDelegate>)delegate  userInfo:(id)userInfo{
    NSError* error = nil;
    NSArray* properties = nil;//@[@"author",@"headline",@"body"];
    NSArray* result = [self itemsForPredicate:filter
                                     userInfo:nil
                                   properties:properties
                            relationshipNames:nil
                                   fetchLimit:5
                              sortDescriptors:nil
                                        error:&error];
    
    [delegate provider:self didFinishExecuteFetchWithResult:result andError:error userInfo:nil];
}

@end
