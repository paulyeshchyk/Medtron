//
//  TipsDataProvider.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/12/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "TipsDataProvider.h"
#import "TipEntity.h"

@implementation TipsDataProvider
static TipsDataProvider *sharedInstance_ = nil;

+ (TipsDataProvider*)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance_ = [[self alloc] init];
    });
    return sharedInstance_;
}

- (NSString*)entityName {
    return kTipEntity;
}

- (id)addTipWithName:(NSString*)name explanation:(NSString*)explanation explanationURL:(NSString*)explanationURL{
    TipEntity* entity = [self newEntity];
    entity.name = name;
    entity.explanation = explanation;
    entity.explanationURL = explanationURL;
    
    return [entity objectID];
}

- (NSUInteger)tipsCountWithFilter:(id)filter {
    
    NSPredicate* predicate = nil;
    NSError* error = nil;
    return [self itemsCountForPredicate:predicate error:&error];
    
}

- (void)performLoadTipsWithFilter:(NSPredicate*)filter delegate:(id<DataProviderDelegate>)delegate  userInfo:(id)userInfo{
    NSError* error = nil;
    NSArray* properties = nil;
    NSArray* result = [self itemsForPredicate:filter
                                     userInfo:nil
                                   properties:properties
                            relationshipNames:nil
                                   fetchLimit:NSUIntegerMax
                              sortDescriptors:nil
                                        error:&error];
    
    [delegate provider:self didFinishExecuteFetchWithResult:result andError:error userInfo:nil];
}

@end
