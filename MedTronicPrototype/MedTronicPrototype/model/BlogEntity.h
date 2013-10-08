//
//  BlogEntity.h
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/7/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface BlogEntity : NSManagedObject

@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSDate * created;
@property (nonatomic, retain) NSString * headline;
@property (nonatomic, retain) NSData * image;

@end
