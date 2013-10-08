//
//  CoreDataProvider.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/5/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataProvider : NSObject

//@property (nonatomic, readonly) NSManagedObjectContext* context;
- (NSError*)saveContext;
- (NSString*)entityName;
- (id)newEntity;
- (NSEntityDescription*)entityDescription;
- (NSUInteger)itemsCountForPredicate:(NSPredicate*)predicate error:(NSError**)error;
- (NSArray*)itemsForPredicate:(NSPredicate*)predicate userInfo:(id)userInfo  properties:(NSArray*)properties error:(NSError**)error;
- (id)objectByObjectId:(NSManagedObjectID*)objectId;
- (id)anyObjectByObjectId:(NSManagedObjectID*)objectId;
- (void)removeObjectByID:(NSManagedObjectID*)objectId;
- (void)removeObject:(NSManagedObject*)object;
@end

@interface NSFetchRequest(UserInfo)
@property (nonatomic, assign) id userInfo;
@end
