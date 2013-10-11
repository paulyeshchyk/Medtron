//
//  BlogDescriptionContainerController.m
//  MedTronicPrototype
//
//  Created by Pavel on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "TabContainerBlogController.h"
#import "BlogHeadlineViewController.h"
#import "BlogDataProvider.h"
#import "NodataAvailableController.h"
#import "BlogDescriptionViewController.h"
#import "ApplicationCommandsManager.h"
#import "UIImageUtils.h"
#import "ApplicationCommand.h"

@interface TabContainerBlogController ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate, DataProviderDelegate>{
    IBOutlet UIPageViewController* pageViewController_;
    IBOutlet BlogDescriptionViewController* blogDescriptionViewController_;
    IBOutlet UIView* descriptionContainer_;
    IBOutlet UIView* blogsContainer_;
    NSArray* blogsArray_;
}
@end

@implementation TabContainerBlogController
@synthesize pageIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    pageIndex  = -1;
    
    [blogsContainer_ addSubview:pageViewController_.view];
    [pageViewController_.view setFrame:blogsContainer_.bounds];
    
    [descriptionContainer_ addSubview:blogDescriptionViewController_.view];
    [blogDescriptionViewController_.view setFrame:descriptionContainer_.bounds];
    [blogDescriptionViewController_ reloadDescription];
    
    [[BlogDataProvider sharedInstance] performLoadBlogsWithFilter:nil delegate:self userInfo:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (IBAction)onBackButtonClicked:(id)sender {
    [[ApplicationCommandsManager sharedInstance] openTabHome:nil];
}

- (IBAction)onShareButtonClicked:(id)sender {
    NSDictionary* args = @{@"rect":[NSValue valueWithCGRect:CGRectMake(0,0,320,20)],@"view":[[UIApplication sharedApplication] keyWindow]};

    [[ApplicationCommandsManager sharedInstance] shareBlog:args];
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
    
    if (finished){
        BlogHeadlineViewController* blogHeadlineViewController = (BlogHeadlineViewController*)[[pageViewController viewControllers] objectAtIndex:0];
        if (blogHeadlineViewController == nil){
            pageIndex = 0;
        } else {
            pageIndex = [blogHeadlineViewController index];
        }

        [blogDescriptionViewController_ reloadDescription];
        
    }
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return [blogsArray_ count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return self.pageIndex;
}

#pragma mark - DataProviderDelegate
- (void)provider:(id)dataprovider didFinishExecuteFetchWithResult:(NSArray*)resultArray andError:(NSError*)error  userInfo:(id)userInfo{
    blogsArray_  = [NSArray arrayWithArray:resultArray];
    self.pageIndex = (pageIndex == -1)?0:self.pageIndex;
    [self reloadPageController];
}

#pragma mark - getters/setters
- (void)setArgs:(NSDictionary *)args {
    id blogID = [args objectForKey:kCommandArgmentNameBlogID];
    if (blogID) {
        __block NSInteger selectedIndex = -1;
        [blogsArray_ enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            *stop = ([obj objectID] == blogID);
            if (*stop){
                selectedIndex = idx;
            }
        }];
        if (selectedIndex >= 0){
            self.pageIndex = selectedIndex;
        }
    }
}

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

    [blogDescriptionViewController_ reloadDescription];
    
}

#pragma mark - BlogDescriptionViewControllerDatasource

- (id)blogsDescription {
    id blogEntity = [self blogAtIndex:self.pageIndex];
    return [blogEntity body];
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
