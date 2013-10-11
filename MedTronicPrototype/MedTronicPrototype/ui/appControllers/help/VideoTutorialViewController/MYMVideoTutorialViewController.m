//
//  MYMVideoTutorialViewController.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/10/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMVideoTutorialViewController.h"
#import "MYMInfusionDataset.h"
#import "MYMCellProtocols.h"

static NSString* const kCellIdentifier = @"CheckboxCellId";

@interface MYMVideoTutorialViewController () <MYMDatasetDelegate>{
    MYMInfusionDataset* dataset_;
}
@property (nonatomic, weak)IBOutlet UITableView* tableView;

@end

@implementation MYMVideoTutorialViewController

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

    dataset_ = [MYMInfusionDataset new];
    dataset_.delegate = self;
    [dataset_ reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView*)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath*)indexPath {
//    [self.datasource switchStateForInfusionAtIndexPath:indexPath];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [[[UIAlertView alloc] initWithTitle:@"Stub" message:@"showing video" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil] show];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataset_ numberOfRowsInSection:section];
}
- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section {
    return [dataset_ sectionAtIndex:section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [dataset_ sectionsCount];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BOOL isConfigured = [dataset_ isInfusionConfiguredAtIndexPath:indexPath];
    NSString* infusionName = [dataset_ infusionNameAtIndexPath:indexPath];;
    
    UITableViewCell<CheckboxCellProtocol>* cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    [cell setTableView:tableView];
    [cell setChecked:isConfigured];
    [cell setName:infusionName];
    [cell setIsMultiSelectAllowed:YES];
    return cell;
}

- (void)willStartLoadDataset:(MYMDataset*)dataset {
    
}

- (void)didEndLoadDataset:(MYMDataset*)dataset {
    [self.tableView reloadData];
}


@end
