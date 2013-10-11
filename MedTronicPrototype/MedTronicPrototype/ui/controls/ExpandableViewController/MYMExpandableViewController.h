//
//  MYMExpandableViewController.h
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MYMExpandableViewControllerDelegate
@required
- (UIView*)viewToExpand;
@end

@interface MYMExpandableViewController : UIViewController
@property (nonatomic, weak)IBOutlet id<MYMExpandableViewControllerDelegate> delegate;
@property (nonatomic, assign)BOOL isExpanded;
@property (nonatomic, strong)NSString* buttonTitle;
@end
