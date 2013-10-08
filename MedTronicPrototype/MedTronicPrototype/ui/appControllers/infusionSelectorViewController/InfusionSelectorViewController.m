//
//  InfusionViewController.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 10/8/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "InfusionSelectorViewController.h"
#import "InfusionEntity.h"
#import "MedtronicCellProtocols.h"
#import "DataProviderProtocol.h"
#import "InfusionConfigurationDataProvider.h"
#import "InfusionDataProvider.h"

static NSString* const kCellIdentifier = @"CheckboxCellId";
static NSString* const kDatasetNameInfusion = @"kDatasetNameInfusion";
static NSString* const kDatasetNameInfusionConfiguration = @"kDatasetNameInfusionConfiguration";

@interface InfusionSelectorViewController () <DataProviderDelegate>{
    NSArray* sensorTypes_;
    NSUInteger providersExecutionCount_;
    NSMutableDictionary* resultset_;
    IBOutlet UITableView* tableView_;
}

@end

@implementation InfusionSelectorViewController

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
    [tableView_ registerNib:[UINib nibWithNibName:@"CheckboxCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kCellIdentifier];
    [self reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
- (void)reloadData {
    resultset_ = [NSMutableDictionary new];
    
    providersExecutionCount_ = 0;
    [[InfusionDataProvider sharedInstance] performLoadConfigurationWithFilter:nil delegate:self userInfo:kDatasetNameInfusion];
    [[InfusionConfigurationDataProvider sharedInstance] performLoadConfigurationWithFilter:nil delegate:self userInfo:kDatasetNameInfusionConfiguration];
    
    
    [tableView_ reloadData];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView*)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath*)indexPath {
    // assume, that cell with checkState==YES can't change its checkState;
    
    InfusionEntity* infusion = [self infusionAtIndexPath:indexPath];
    
    [[InfusionConfigurationDataProvider sharedInstance] switchConfigurationStateForInfusionID:[infusion objectID]];
    
    [tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self datasetInfusion] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InfusionEntity* infusion = [self infusionAtIndexPath:indexPath];
    BOOL isConfigured = [self isInfusionConfigured:infusion];
    
    UITableViewCell<CheckboxCellProtocol>* cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    [cell setTableView:tableView];
    [cell setChecked:isConfigured];
    [cell setName:infusion.name];
    [cell setIsMultiSelectAllowed:YES];
    return cell;
}

#pragma mark - DataProviderDelegate
- (void)provider:(id)dataprovider didFinishExecuteFetchWithResult:(NSArray*)resultArray andError:(NSError*)error userInfo:(id)userInfo {
    [resultset_ setObject:resultArray forKey:userInfo];
    
    providersExecutionCount_++;
    if (providersExecutionCount_ == 2) {
        [tableView_ reloadData];
    }
}

#pragma mark - datasets
- (id)datasetInfusionConfiguration {
    return [resultset_ objectForKey:kDatasetNameInfusionConfiguration];
}

- (BOOL)isInfusionConfigured:(id)infusionID {
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"infusion == %@",infusionID];
    NSArray* configurations = [self datasetInfusionConfiguration];
    NSArray* array = [configurations filteredArrayUsingPredicate:predicate];
    return ([array count] != 0);
}

- (id)datasetInfusion {
    return [resultset_ objectForKey:kDatasetNameInfusion];
}

- (id)infusionAtIndex:(NSInteger)index {
    return [[self datasetInfusion] objectAtIndex:index];
}

- (id)infusionAtIndexPath:(NSIndexPath*)indexPath {
    return [self infusionAtIndex:indexPath.row];
}

- (void)makeConfigurationForInfusion:(id)infusion{
}


@end
