//
//  ActionsViewController.h
//  MedTronicPrototype
//
//  Created by Pavel on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActionsViewConrollerProtocol.h"

@interface ActionsViewController : UIViewController <ActionsViewConrollerProtocol>

+(ActionsViewController*)newInstance;

@property (nonatomic, strong) IBOutlet id<ActionsViewConrollerDatasource>datasource;

@end
