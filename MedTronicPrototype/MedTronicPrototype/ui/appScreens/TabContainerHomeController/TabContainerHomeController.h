//
//  BlogActionsContainerController.h
//  MedTronicPrototype
//
//  Created by Pavel on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "UIViewControllerWithContext.h"
#import "ActionsViewConrollerProtocol.h"
#import "UIPageControl+CustomIndicatorSize.h"

@interface TabContainerHomeController : UIViewControllerWithContext <ActionsViewConrollerDatasource>

@property (nonatomic, assign)NSInteger pageIndex;

@end
