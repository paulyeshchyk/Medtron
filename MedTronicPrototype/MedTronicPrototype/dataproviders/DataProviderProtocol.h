//
//  DataProviderProtocol.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/5/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol DataProviderProtocol;

@protocol DataProviderDelegate <NSObject>
//@property (nonatomic, weak)id<DataProviderProtocol> dataprovider;
@required
- (void)provider:(id)dataprovider didFinishExecuteFetchWithResult:(NSArray*)resultArray andError:(NSError*)error userInfo:(id)userInfo;
@optional
- (void)provider:(id)dataprovider didFinishInsertWithResult:(NSArray*)resultArray andError:(NSError*)error userInfo:(id)userInfo;
- (void)provider:(id)dataprovider didFinishDeleteWithResult:(NSArray*)resultArray andError:(NSError*)error userInfo:(id)userInfo;
@end



@protocol DataProviderProtocol <NSObject>

@end
