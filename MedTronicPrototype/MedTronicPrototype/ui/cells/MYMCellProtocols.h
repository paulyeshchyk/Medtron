//
//  MedtronicCellProtocols.h
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/8/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CheckboxCellProtocol <NSObject>
@required
@property (nonatomic, assign)BOOL checked;
@property (nonatomic, strong)NSString* name;
@property (nonatomic, strong)UITableView* tableView;
@property (nonatomic, assign)BOOL isMultiSelectAllowed;

@end
