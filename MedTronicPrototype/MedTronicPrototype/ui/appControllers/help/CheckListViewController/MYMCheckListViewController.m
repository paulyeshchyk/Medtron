//
//  MYMCheckListViewController.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMCheckListViewController.h"
#import "MYMCheckListItemEditorViewController.h"
#import "MYMCheckListDataset.h"
#import "MYMCellProtocols.h"

static NSString* const kCellIdentifier = @"CheckboxCellId";

@interface MYMCheckListViewController () <UITableViewDataSource, UITableViewDelegate,MYMDatasetDelegate >{
    UIBarButtonItem* uncheckAllButtonItem_;
    UIBarButtonItem* addItemButtonItem_;
}
@property (nonatomic, weak)IBOutlet UITableView* tableView;
@property (nonatomic, strong)MYMCheckListDataset* dataset;
@end

@implementation MYMCheckListViewController

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
    
    self.dataset = [MYMCheckListDataset new];
    self.dataset.delegate = self;
    [self reloadData];
    
    addItemButtonItem_ = [[UIBarButtonItem alloc] initWithTitle:@"Add Item" style:UIBarButtonItemStyleBordered target:self action:@selector(onAddItem:)];
    self.toolbarItems = @[ [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],addItemButtonItem_];
 
    uncheckAllButtonItem_ = [[UIBarButtonItem alloc] initWithTitle:@"Uncheck all" style:UIBarButtonItemStyleBordered target:self action:@selector(onUncheckAll:)];
    [self.navigationItem setRightBarButtonItem:uncheckAllButtonItem_];
    self.navigationController.toolbarHidden=NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)reloadData {
    [self.dataset reloadData];

}

- (void)onUncheckAll:(id)sender {
    [self.dataset makeAllItemsUnchecked];
    [self.dataset saveChanges];
    [self reloadData];
}

- (void)onAddItem:(id)sender {
    
    __block MYMCheckListViewController* block_self = self;
    
    OnCheckListCloseBlock closeBlock = ^(id sender,BOOL shouldSave, NSString* value){
        if ((shouldSave) && ([value length] > 0)){
            MYMCheckListDatasetAddCallback callback = ^{
                [block_self reloadData];
            };
            
            [block_self.dataset addCheckListItemWithName:value callback:callback];
        }
        
        [block_self.navigationController dismissViewControllerAnimated:YES completion:NULL];
    };
    
    MYMCheckListItemEditorViewController* editor = [[MYMCheckListItemEditorViewController alloc] initWithNibName:@"MYMCheckListItemEditorViewController" bundle:[NSBundle mainBundle]];
    [editor setCloseBlock:closeBlock];
    
    UINavigationController* navC = [[UINavigationController alloc] initWithRootViewController:editor];
    [self.navigationController presentViewController:navC animated:YES completion:NULL];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataset numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* checkListItemName = [self.dataset checkListItemNameAtIndexPath:indexPath];
    BOOL checkListItemChecked = [self.dataset checkListItemCheckedStateAtIndexPath:indexPath];

    UITableViewCell<CheckboxCellProtocol>* cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];

    [cell setTableView:tableView];
    [cell setChecked:checkListItemChecked];
    [cell setName:checkListItemName];
    [cell setIsMultiSelectAllowed:YES];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    [self.dataset switchCheckmarkForItemAtIndexPath:indexPath];
    [self.dataset saveChanges];
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete){
        [self.tableView beginUpdates];
        [self.dataset deleteObjectsAtIndexPaths:@[indexPath]];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView endUpdates];
        [self.dataset saveChanges];
        
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
        return UITableViewCellEditingStyleDelete;
}

#pragma mark - MYMDatasetDelegate

- (void)willStartLoadDataset:(MYMDataset*)dataset {
    
}

- (void)didEndLoadDataset:(MYMDataset*)dataset {
    [self.tableView reloadData];
}

@end
