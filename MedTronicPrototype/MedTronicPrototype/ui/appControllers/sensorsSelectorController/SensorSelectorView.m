//
//  SensorSelectorView.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/9/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "SensorSelectorView.h"
#import "SensorEntity.h"
#import "SensorTypeEntity.h"
#import "MedtronicCellProtocols.h"

static NSString* const kCellIdentifier = @"CheckboxCellId";

@implementation SensorSelectorView
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

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize tableViewSize = [self.tableView sizeThatFits:size];
    self.frame = CGRectMake(0,0,tableViewSize.width, tableViewSize.height);
    return tableViewSize;
}

#pragma mark -
- (void)reloadView {
    [self.tableView reloadData];
}


#pragma mark - UITableViewDataSource
- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section {
    return [datasource sensorTypeNameAtIndex:section];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return [datasource sensorsCountAtSection:section];
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    BOOL isConfigured = [datasource isSensorConfiguredAtSection:indexPath.section andRow:indexPath.row];
    NSString* sensorName = [datasource sensorNameAtSection:indexPath.section andRow:indexPath.row];
    
    UITableViewCell<CheckboxCellProtocol>* cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    [cell setTableView:tableView];
    [cell setChecked:isConfigured];
    [cell setName:sensorName];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    return [datasource sensorTypeCount];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView*)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath*)indexPath {
    [datasource addConfigurationForSection:indexPath.section andRow:indexPath.row];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
