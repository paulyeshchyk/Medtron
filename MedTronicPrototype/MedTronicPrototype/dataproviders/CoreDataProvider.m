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

@implementation CoreDataProvider
//@synthesize context;

- (NSManagedObjectContext*)context {
    return [[CoreDataManager sharedInstance] managedObjectContext];
}

- (NSError*)saveContext {
    return [[CoreDataManager sharedInstance] saveContext];
    
}

- (NSString*)entityName {
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

- (NSArray*)itemsForPredicate:(NSPredicate*)predicate  userInfo:(id)userInfo properties:(NSArray*)properties error:(NSError**)error{
    NSString* entityName = self.entityName;
    if ([entityName length] == 0){
        return nil;
    }
    
    NSEntityDescription* entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:[self context]];
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setUserInfo:userInfo];
    [request setPropertiesToFetch:properties];
    [request setEntity:entity];
    [request setPredicate:predicate];
    [request setFetchLimit:5];
//    [request setResultType:NSDictionaryResultType];
    
    return [self.context executeFetchRequest:request error:error];
}

- (id)anyObjectByObjectId:(NSManagedObjectID*)objectId {
    return [self.context objectWithID:objectId];
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
    NSArray* result = [self.context executeFetchRequest:request error:&error];
    if (!error){
        return [result lastObject];
    } else {
        return nil;
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