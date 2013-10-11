//
//  MYMCheckListItemEditorViewController.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/11/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMCheckListItemEditorViewController.h"

@interface MYMCheckListItemEditorViewController ()
@property (nonatomic, weak)IBOutlet UITextField* textField;
@end

@implementation MYMCheckListItemEditorViewController

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

    self.title = @"New checklist item";
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(onDoneClicked:)]];
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(onCancelClicked:)]];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onCancelClicked:(id)sender {
    if (self.closeBlock != NULL){
        self.closeBlock(self,NO,nil);
    }
}

- (void)onDoneClicked:(id)sender {
    if (self.closeBlock != NULL){
        self.closeBlock(self,YES,self.textField.text);
    }
}

@end
