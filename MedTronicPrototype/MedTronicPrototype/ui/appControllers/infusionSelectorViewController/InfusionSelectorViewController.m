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
#import "InfusionSelectorViewProtocol.h"

static NSString* const kDatasetNameInfusion = @"kDatasetNameInfusion";
static NSString* const kDatasetNameInfusionConfiguration = @"kDatasetNameInfusionConfiguration";

@interface InfusionSelectorViewController () <DataProviderDelegate, InfusionSelectorViewDatasource>{
    NSArray* sensorTypes_;
    NSUInteger providersExecutionCount_;
    NSMutableDictionary* resultset_;
    UIView<InfusionSelectorViewProtocol>* infusionView_;
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
    infusionView_ = (UIView<InfusionSelectorViewProtocol>*)self.view;
    infusionView_.datasource = self;
    
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
    
    [infusionView_ reloadView];
}


#pragma mark - DataProviderDelegate
- (void)provider:(id)dataprovider didFinishExecuteFetchWithResult:(NSArray*)resultArray andError:(NSError*)error userInfo:(id)userInfo {
    [resultset_ setObject:resultArray forKey:userInfo];
    
    providersExecutionCount_++;
    if (providersExecutionCount_ == 2) {
        [infusionView_ reloadView];
    }
}

#pragma mark - InfusionSelectorViewDatasource
- (id)datasetInfusion {
    return [resultset_ objectForKey:kDatasetNameInfusion];
}

- (id)infusionAtIndexPath:(NSIndexPath*)indexPath {
    return [self infusionAtIndex:indexPath.row];
}

- (id)infusionAtIndex:(NSInteger)index {
    return [[self datasetInfusion] objectAtIndex:index];
}

- (BOOL)isInfusionConfigured:(id)infusionID {
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"infusion == %@",infusionID];
    NSArray* configurations = [self datasetInfusionConfiguration];
    NSArray* array = [configurations filteredArrayUsingPredicate:predicate];
    return ([array count] != 0);
}

- (BOOL)isInfusionConfiguredAtIndexPath:(NSIndexPath*)indexPath {
    InfusionEntity* infusion = [self infusionAtIndexPath:indexPath];
    return [self isInfusionConfigured:infusion];
}

- (id)datasetInfusionConfiguration {
    return [resultset_ objectForKey:kDatasetNameInfusionConfiguration];
}


- (void)makeConfigurationForInfusion:(id)infusion{
    [[InfusionConfigurationDataProvider sharedInstance] switchConfigurationStateForInfusionID:[infusion objectID]];
}

- (void)makeConfigurationForInfusionAtIndexPath:(NSIndexPath*)indexPath {
    InfusionEntity* infusion = [self infusionAtIndexPath:indexPath];
    [self makeConfigurationForInfusion:infusion];
}
@end
