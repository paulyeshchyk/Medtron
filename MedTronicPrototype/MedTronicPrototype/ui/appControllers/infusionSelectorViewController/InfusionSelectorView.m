//
//  InfusionSelectorView.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/9/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "InfusionSelectorView.h"
#import "MedtronicCellProtocols.h"


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
    [self.datasource switchStateForInfusionAtIndexPath:indexPath];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datasource numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BOOL isConfigured = [self.datasource isInfusionConfiguredAtIndexPath:indexPath];
    NSString* infusionName = [self.datasource infusionNameAtIndexPath:indexPath];
    
    UITableViewCell<CheckboxCellProtocol>* cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    [cell setTableView:tableView];
    [cell setChecked:isConfigured];
    [cell setName:infusionName];
    [cell setIsMultiSelectAllowed:YES];
    return cell;
}

@end
