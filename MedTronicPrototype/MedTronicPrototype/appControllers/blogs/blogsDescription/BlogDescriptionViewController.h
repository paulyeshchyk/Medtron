//
//  BlogDescriptionViewController.h
//  MedTronicPrototype
//
//  Created by Pavel on 10/5/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlogDescriptionViewControllerProtocol.h"

@interface BlogDescriptionViewController : UIViewController <BlogDescriptionViewControllerProtocol>
@property (nonatomic, strong)IBOutlet id<BlogDescriptionViewControllerDatasource>datasource;
@end
