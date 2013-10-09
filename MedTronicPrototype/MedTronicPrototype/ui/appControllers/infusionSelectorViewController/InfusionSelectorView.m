//
//  InfusionSelectorView.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/9/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "InfusionSelectorView.h"
#import "MedtronicCellProtocols.h"
#import "InfusionEntity.h"

static NSString* const kCellIdentifier = @"CheckboxCellId";
@interface InfusionSelectorView(){
}
@end

@implementation InfusionSelectorView
@synthesize datasource;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.tableView registerNib:[UINib nibWithNibName:@"CheckboxCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kCellIdentifier];
    
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize tableViewSize = [self.tableView sizeThatFits:size];
    self.frame = CGRectMake(0,0,tableViewSize.width, tableViewSize.height);
    return tableViewSize;
}


- (void)reloadView {
    [self.tableView reloadData];

}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView*)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath*)indexPath {
    // assume, that cell with checkState==YES can't change its checkState;
    
    [self.datasource switchStateForInfusionAtIndexPath:indexPath];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.datasource datasetInfusion] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InfusionEntity* infusion = [self.datasource infusionAtIndexPath:indexPath];
    BOOL isConfigured = [self.datasource isInfusionConfigured:infusion];
    
    UITableViewCell<CheckboxCellProtocol>* cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    [cell setTableView:tableView];
    [cell setChecked:isConfigured];
    [cell setName:infusion.name];
    [cell setIsMultiSelectAllowed:YES];
    return cell;
}

@end
