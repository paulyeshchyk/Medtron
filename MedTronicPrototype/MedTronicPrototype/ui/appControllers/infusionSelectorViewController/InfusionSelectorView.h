//
//  InfusionSelectorView.h
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/9/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfusionSelectorViewProtocol.h"
@interface InfusionSelectorView : UIView <InfusionSelectorViewProtocol, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak)IBOutlet UITableView* tableView;
@end
