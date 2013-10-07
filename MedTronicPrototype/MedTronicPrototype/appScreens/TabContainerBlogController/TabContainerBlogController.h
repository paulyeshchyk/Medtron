//
//  BlogDescriptionContainerController.h
//  MedTronicPrototype
//
//  Created by Pavel on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlogDescriptionViewControllerProtocol.h"

@interface TabContainerBlogController : UIViewControllerWithContext <BlogDescriptionViewControllerDatasource>
@property (nonatomic, assign)NSInteger pageIndex;
- (IBAction)onBackButtonClicked:(id)sender;
- (IBAction)onShareButtonClicked:(id)sender;
@end
