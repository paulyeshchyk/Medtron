//
//  BlogActionsContainerController.m
//  MedTronicPrototype
//
//  Created by Pavel on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "TabContainerHomeController.h"
#import "BlogHeadlineViewController.h"
#import "ActionsViewController.h"
#import "ApplicationCommandsManager.h"
#import "BlogDataProvider.h"
#import "CoreDataManager.h"
#import "DataProviderProtocol.h"
#import "ApplicationCommand.h"
#import "NodataAvailableController.h"


@interface TabContainerHomeController ()  <UIPageViewControllerDataSource,UIPageViewControllerDelegate, DataProviderDelegate>{
@private
    IBOutlet UIPageViewController* pageViewController_;
    IBOutlet ActionsViewController* actionsViewController_;
    IBOutlet UIView* actionsContainer_;
    IBOutlet UIView* blogsContainer_;
    NSArray* blogsArray_;

}
- (id)blogAtIndex:(NSInteger)index;
@end

@implementation TabContainerHomeController
@synthesize pageIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];

    

    pageIndex = -1;
    
    [blogsContainer_ addSubview:pageViewController_.view];
    [pageViewController_.view setFrame:blogsContainer_.bounds];
//    [pageViewController_.view setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    
    [actionsContainer_ addSubview:actionsViewController_.view];
    [actionsViewController_.view setFrame:actionsContainer_.bounds];
//    [actionsViewController_.view setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [actionsViewController_ reloadActionSheet];
    
    [[BlogDataProvider sharedInstance] performLoadBlogsWithFilter:nil delegate:self];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}


#pragma mark - DataProviderDelegate
- (void)provider:(id)dataprovider didFinishExecuteFetchWithResult:(NSArray *)resultArray andError:(NSError *)error  userInfo:(id)userInfo{
    blogsArray_  = [NSArray arrayWithArray:resultArray];
    self.pageIndex = (pageIndex == -1)?0:self.pageIndex;
}

#pragma mark - UIPageViewControllerDatasource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    BlogHeadlineViewController* beforeViewController = (BlogHeadlineViewController* )viewController;
    NSInteger index = (beforeViewController.index -1);
    return [self headlineControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    BlogHeadlineViewController* beforeViewController = (BlogHeadlineViewController* )viewController;
    NSInteger index = (beforeViewController.index + 1);
    return [self headlineControllerAtIndex:index];
}

#pragma mark - UIPageViewControllerDelegate
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {
    
    if (completed){
        BlogHeadlineViewController* blogHeadlineViewController = (BlogHeadlineViewController*)[pageViewController.viewControllers lastObject];
        pageIndex = [blogHeadlineViewController index];
        
        [actionsViewController_ reloadActionSheet];
    }
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return [blogsArray_ count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return self.pageIndex;
}

#pragma mark -
- (IBAction)onTapGesture:(UIGestureRecognizer*)recognizer {
    NSDictionary* args = nil;
    id blog = [self blogAtIndex:self.pageIndex];
    id blogID = [blog objectID];
    if (blogID){
        args = @{kCommandArgmentNameBlogID: blogID};
    }
    [[ApplicationCommandsManager sharedInstance] openBlog:args];
}

#pragma mark - getters/setters

- (void)setPageIndex:(NSInteger)aPageIndex {
    if (aPageIndex != pageIndex) {
        pageIndex = ([self isIndexOutOfBounds:aPageIndex])?0:aPageIndex;
        [self reloadPageController];
    }
}

#pragma mark - private

- (void)reloadPageController {

    UIViewController* blogHeadlineViewController = [self headlineControllerAtIndex:self.pageIndex];
    
    NSArray* blogControllersArray = nil;
    if (blogHeadlineViewController) {
        blogControllersArray = @[blogHeadlineViewController];
    } else {
        blogControllersArray = @[[NodataAvailableController newInstance]];
    }
    
    [pageViewController_ setViewControllers:blogControllersArray
                                  direction:UIPageViewControllerNavigationDirectionForward
                                   animated:NO
                                 completion:NULL];
    
    [actionsViewController_ reloadActionSheet];
}

#pragma mark - ActionsViewConrollerDatasource

- (NSString*)blogsHeadline {
    id blogEntity = [self blogAtIndex:self.pageIndex];
    return [blogEntity headline];
}

#pragma mark -

- (BlogHeadlineViewController*)headlineControllerAtIndex:(NSInteger)index {
    id blogEntity = [self blogAtIndex:index];
    return [BlogHeadlineViewController newInstanceForBlogEntity:blogEntity index:index];
}

- (BOOL)isIndexOutOfBounds:(NSInteger)aIndex {
    BOOL result = NO;
    NSInteger blogsCount = [blogsArray_ count];
    if (aIndex >= blogsCount) {
        result = YES;
    } else {
        if (blogsCount == 0){
            result = YES;
        } else {
            result = (aIndex < 0);
        }
    }
    return result;
}


- (id)blogAtIndex:(NSInteger)index {
    if ([self isIndexOutOfBounds:index]){
        return nil;
    }
    
    return [blogsArray_ objectAtIndex:index];
}

@end
