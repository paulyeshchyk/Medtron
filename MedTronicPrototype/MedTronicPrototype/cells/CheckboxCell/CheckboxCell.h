//
//  CheckboxCell.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckboxCell : UITableViewCell
@property (nonatomic, assign)BOOL checked;
@property (nonatomic, strong)NSString* name;
@property (nonatomic, strong)UITableView* tableView;
@end
