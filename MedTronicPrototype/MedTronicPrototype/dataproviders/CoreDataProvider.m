//
//  CoreDataProvider.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/5/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "CoreDataProvider.h"
#import "CoreDataManager.h"
#import <objc/runtime.h>
@interface CoreDataProvider(){
    NSManagedObjectContext* providersContext_;
    NSMutableSet* listeners_;

}
@end

@implementation CoreDataProvider
//@synthesize context;




- (void)dealloc {
    [listeners_ removeAllObjects];
    listeners_ = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSManagedObjectContextObjectsDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSManagedObjectContextDidSaveNotification object:nil];
}

- (void)addListener:(id<MYMDatasetListenerProtocol>)listener {
    [listeners_ addObject:listener];
}

- (void)removeListener:(id<MYMDatasetListenerProtocol>)listener {
    [listeners_ removeObject:listener];
}

- (void)contextHasChanged {
    [listeners_ enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        if ([obj respondsToSelector:@selector(contextHasChanged)]){
            [obj performSelector:@selector(contextHasChanged)];
        }
    }];
}

- (void)contextHasRollbacked {
    [listeners_ enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        if ([obj respondsToSelector:@selector(contextHasRollbacked)]){
            [obj performSelector:@selector(contextHasRollbacked)];
        }
    }];
}

- (void)contextHasSaved {
    [listeners_ enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        if ([obj respondsToSelector:@selector(contextHasSaved)]){
            [obj performSelector:@selector(contextHasSaved)];
        }
    }];
}


- (NSManagedObjectContext*)context {
    if (providersContext_ == nil){
//        providersContext_ = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
//        NSManagedObjectContext* parentContext = [[CoreDataManager sharedInstance] managedObjectContext];
//        [providersContext_ setParentContext:parentContext];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onNSManagedObjectContextObjectsDidChangeNotification:) name:NSManagedObjectContextObjectsDidChangeNotification object:nil];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onNSManagedObjectContextObjectsDidSaveNotification:) name:NSManagedObjectContextDidSaveNotification object:nil];
        providersContext_ = [[CoreDataManager sharedInstance] managedObjectContext];
    }
    
    return providersContext_;
}

- (NSError*)saveContext {
    __block NSError* error  = nil;
    if ([providersContext_ hasChanges]){
        [providersContext_ save:&error];
        if (error == nil){
//            [[CoreDataManager sharedInstance] saveContext];
        } else {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        }
        
    }
    return error;
}

- (NSError*)rollback {
    __block NSError* result  = nil;
    if ([providersContext_ hasChanges]){
        [providersContext_ rollback];

        [[CoreDataManager sharedInstance] rollback];
        
    }
    return result;
}

- (NSString*)entityName {
    NSCAssert(NO, @"entityName must be defined");
    return nil;
}

- (id)newEntity {
    NSString* entityName = self.entityName;
    if ([entityName length] == 0){
        return nil;
    } else {
        return [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:[self context]];
    }
}

- (NSEntityDescription*)entityDescription {
    NSString* entityName = self.entityName;
    if ([entityName length] == 0){
        return nil;
    } else {
        return [NSEntityDescription entityForName:entityName inManagedObjectContext:[self context]];
    }
}

- (NSUInteger)itemsCountForPredicate:(NSPredicate*)predicate error:(NSError**)error{

    NSEntityDescription* entity = [self entityDescription];
    if (entity == nil){
        return 0;
    }
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    [request setPredicate:predicate];
    

    return [[self context] countForFetchRequest:request error:error];
}

- (NSArray*)itemsForPredicate:(NSPredicate*)predicate userInfo:(id)userInfo  properties:(NSArray*)properties relationshipNames:(NSArray*)relationshipNames fetchLimit:(NSInteger)fetchLimit sortDescriptors:(NSArray*)sortDescriptors error:(NSError**)error{
    NSString* entityName = self.entityName;
    if ([entityName length] == 0){
        return nil;
    }
    
    NSEntityDescription* entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:[self context]];

    NSFetchRequestResultType resultType = NSManagedObjectResultType;
    
    NSMutableArray* propertiesToFetch = nil;
    if ([properties count]>0){
        propertiesToFetch = [NSMutableArray new];
        NSDictionary *entityProperties = [entity propertiesByName];
        
        for (NSString*propName in properties) {
            [propertiesToFetch addObject:[entityProperties objectForKey:propName]];
        }
        resultType = NSDictionaryResultType;
    }
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setUserInfo:userInfo];
    [request setPropertiesToFetch:propertiesToFetch];
    [request setRelationshipKeyPathsForPrefetching:relationshipNames];
    [request setEntity:entity];
    [request setPredicate:predicate];
    [request setFetchLimit:fetchLimit];
    [request setSortDescriptors:sortDescriptors];
    [request setResultType:resultType];
    
    return [[self context] executeFetchRequest:request error:error];
}

- (id)anyObjectByObjectId:(NSManagedObjectID*)objectId {
    return [[self context] objectWithID:objectId];
}
- (void)removeObject:(NSManagedObject*)object {
    [[self context] deleteObject:object];
}

- (void)removeObjectByID:(NSManagedObjectID*)objectId {
    [self removeObject:[self anyObjectByObjectId:objectId]];
}

- (id)objectByObjectId:(NSManagedObjectID*)objectId {
    NSEntityDescription* entity = [NSEntityDescription entityForName:self.entityName inManagedObjectContext:[self context]];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self == %@", objectId];
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    [request setPredicate:predicate];
    
    NSError* error = nil;
    NSArray* result = [[self context] executeFetchRequest:request error:&error];
    if (!error){
        return [result lastObject];
    } else {
        return nil;
    }
}


- (NSArray*)validObjectsFromNotificationObjects:(NSArray*)notificationObjects {
    NSMutableArray* result = [NSMutableArray new];
    Class clazz = NSClassFromString(self.entityName);
    [notificationObjects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([[obj class] isKindOfClass:clazz]){
            [result addObject:obj];
        }
    }];
    return result;
    
}
         
- (void)onNSManagedObjectContextObjectsDidSaveNotification:(NSNotification*)notification {
    if (self.entityName == nil){
        return;
    }
    [self contextHasSaved];
}
         
- (void)onNSManagedObjectContextObjectsDidChangeNotification:(NSNotification*)notification {
    if (self.entityName == nil){
        return;
    }
    NSArray* insertedObjects = [self validObjectsFromNotificationObjects:[[notification userInfo] objectForKey:NSInsertedObjectsKey]];
    NSArray* deletedObjects = [self validObjectsFromNotificationObjects:[[notification userInfo] objectForKey:NSDeletedObjectsKey]];
    NSArray* updatedObjects = [self validObjectsFromNotificationObjects:[[notification userInfo] objectForKey:NSUpdatedObjectsKey]];
    
    
    if (([insertedObjects count] >0) || ([deletedObjects count] >0) || ([updatedObjects count] >0)){
        [self contextHasChanged];
    }
    
    
    
}

@end

static void *NSFetchRequestUserInfoResultKey;
@implementation NSFetchRequest(UserInfo)

@dynamic userInfo;

- (void)setUserInfo:(id)userInfo {
    objc_setAssociatedObject(self, NSFetchRequestUserInfoResultKey, userInfo, OBJC_ASSOCIATION_ASSIGN);
}
- (id)userInfo {
    return objc_getAssociatedObject(self, NSFetchRequestUserInfoResultKey);
}

@end