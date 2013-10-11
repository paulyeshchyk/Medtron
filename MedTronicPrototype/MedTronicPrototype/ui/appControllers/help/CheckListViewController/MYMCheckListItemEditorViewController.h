//
//  MYMCheckListItemEditorViewController.h
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMViewController.h"
typedef void(^OnCheckListCloseBlock)(id sender,BOOL shouldAddValue, NSString* value);
@interface MYMCheckListItemEditorViewController : MYMViewController
@property (nonatomic, copy)OnCheckListCloseBlock closeBlock;
@end
