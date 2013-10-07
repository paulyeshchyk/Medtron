//
//  BlogHeadlineViewController.m
//  MedTronicPrototype
//
//  Created by Pavel on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "BlogHeadlineViewController.h"
#import "BlogHeadlineView.h"

@interface BlogHeadlineViewController () {
}

@end

@implementation BlogHeadlineViewController
+ (BlogHeadlineViewController*)newInstanceForIndex:(NSInteger)index {
    BlogHeadlineViewController* result = [[BlogHeadlineViewController alloc] initWithNibName:@"BlogHeadlineViewController" bundle:nil];
    [result setIndex:index];
    return result;
}

+ (BlogHeadlineViewController*)newInstanceForBlogEntity:(BlogEntity*)blogEntity index:(NSInteger)index{
    if (blogEntity == nil){
        return nil;
    }
    
    
    BlogHeadlineViewController* result = [[BlogHeadlineViewController alloc] initWithNibName:@"BlogHeadlineViewController" bundle:nil];
    [result setBlogEntity:blogEntity];
    [result setIndex:index];
    return result;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _index = -1;
        _blogEntity = nil;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setBlogEntity:(BlogEntity *)blogEntity {
    _blogEntity = blogEntity;
    [self reloadData];
}

#pragma mark -
- (void)reloadData {//157 188 135
    if ([self isViewLoaded]){
        [((BlogHeadlineView*)self.view) setCreatedDate:_blogEntity.created];
        [((BlogHeadlineView*)self.view) setImageData:_blogEntity.image];

    }
    
}
@end
