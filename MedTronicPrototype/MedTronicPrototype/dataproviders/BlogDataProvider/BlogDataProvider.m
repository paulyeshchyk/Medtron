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

- (id)initWithContext:(NSManagedObjectContext*)context {
    self = [super init];
    if (self){
    }
    return self;
}

- (NSString*)entityName {
    return kEntityBlog;
}

- (id)addBlogWithHeadline:(NSString*)headline body:(NSString*)body author:(NSString*)author image:(NSData*)image{
    BlogEntity* blogEntity = [self newEntity];
    blogEntity.headline = headline;
    blogEntity.body = body;
    blogEntity.author = author;
    blogEntity.created = [NSDate date];
    blogEntity.image = image;

    [self saveContext];
    return [blogEntity objectID];
}

- (NSUInteger)blogsCountWithFilter:(id)filter {

    NSPredicate* predicate = nil;
    NSError* error = nil;
    return [self itemsCountForPredicate:predicate error:&error];
    
}

- (void)performLoadBlogsWithFilter:(NSPredicate*)filter delegate:(id<DataProviderDelegate>)delegate {
    NSError* error = nil;
    NSArray* properties = nil;//@[@"author",@"headline",@"body"];
    NSArray* result = [self itemsForPredicate:filter userInfo:nil properties:properties error:&error];
    
    [delegate provider:self didFinishExecuteFetchWithResult:result andError:error userInfo:nil];
}

@end
