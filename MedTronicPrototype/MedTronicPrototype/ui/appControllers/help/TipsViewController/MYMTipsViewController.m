//
//  MYMTipsViewController.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMTipsViewController.h"
#import "MYMCellProtocols.h"
#import "MYMTipsDataset.h"
#import "MYMTipsExplanationViewController.h"

@interface MYMTipsViewController () <MYMDatasetDelegate,UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak)IBOutlet UITableView* tableView;
@property (nonatomic, strong)MYMTipsDataset* dataset;
@end

static NSString* const kCellIdentifier = @"CheckboxCellId";
@implementation MYMTipsViewController

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
    [self.tableView registerNib:[UINib nibWithNibName:@"CheckboxCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kCellIdentifier];

    self.dataset = [MYMTipsDataset new];
    self.dataset.delegate = self;
    [self reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
- (void)reloadData {
    [self.dataset reloadData];

}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataset numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* tipName = [self.dataset tipNameAtIndexPath:indexPath];

    UITableViewCell<CheckboxCellProtocol>* cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    [cell setTableView:tableView];
    [cell setName:tipName];
    [cell setIsMultiSelectAllowed:YES];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    __block MYMTipsViewController* block_self = self;
    MYMTipsExplanationViewController* explanation = [[MYMTipsExplanationViewController alloc] initWithNibName:@"MYMTipsExplanationViewController" bundle:[NSBundle mainBundle]];
    explanation.text = [self.dataset tipExplanationAtIndexPath:indexPath];
    explanation.urlString = [self.dataset tipExplanationURLAtIndexPath:indexPath];
    explanation.closeBlock = ^(id sender){
        [block_self.navigationController dismissViewControllerAnimated:YES completion:NULL];
    };
    UINavigationController* navC = [[UINavigationController alloc] initWithRootViewController:explanation];
    [self.navigationController presentViewController:navC animated:YES completion:NULL];
    
    
}
#pragma mark - MYMDatasetDelegate

- (void)willStartLoadDataset:(MYMDataset*)dataset {
    
}

- (void)didEndLoadDataset:(MYMDataset*)dataset {
    [self.tableView reloadData];
}

@end
