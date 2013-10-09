//
//  SensorSelectorView.h
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/9/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SensorSelectorViewProtocol.h"

@interface SensorSelectorView : UIView <SensorSelectorViewProtocol, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak)IBOutlet UITableView* tableView;

@end
