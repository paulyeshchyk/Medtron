//
//  MYMCheckListViewController.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMCheckListViewController.h"
#import "MYMCheckListItemEditorViewController.h"
@interface MYMCheckListViewController () {
    UIBarButtonItem* uncheckAllButtonItem_;
    UIBarButtonItem* addItemButtonItem_;
}
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
    
    addItemButtonItem_ = [[UIBarButtonItem alloc] initWithTitle:@"Add Item" style:UIBarButtonItemStylePlain target:self action:@selector(onAddItem:)];
    self.toolbarItems = @[ [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],addItemButtonItem_];
 
    uncheckAllButtonItem_ = [[UIBarButtonItem alloc] initWithTitle:@"Uncheck all" style:UIBarButtonItemStylePlain target:self action:@selector(onUncheckAll:)];
    [self.navigationItem setRightBarButtonItem:uncheckAllButtonItem_];
    self.navigationController.toolbarHidden=NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onUncheckAll:(id)sender {
}

- (void)onAddItem:(id)sender {
    MYMCheckListItemEditorViewController* editor = [[MYMCheckListItemEditorViewController alloc] initWithNibName:@"MYMCheckListItemEditorViewController" bundle:[NSBundle mainBundle]];
    editor.closeBlock = ^(id sender,BOOL shouldSave, NSString* value){

        if ((shouldSave) && ([value length] > 0)){
        }
        
        [self.navigationController dismissViewControllerAnimated:YES completion:^{
            
        }];
    };
    
    UINavigationController* navC = [[UINavigationController alloc] initWithRootViewController:editor];
    
    [self.navigationController presentViewController:navC animated:YES completion:^{
        
    }];
}


@end
