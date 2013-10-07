//
//  SettingsViewController.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "SettingsViewController.h"
#import "SensorTypeDataProvider.h"
#import "SensorConfigurationDataProvider.h"
#import "SensorDataProvider.h"
#import "SensorTypeEntity.h"
#import "SensorEntity.h"
#import "CheckboxCell.h"

static NSString* const kDatasetNameSensorType = @"sensorType";
static NSString* const kDatasetNameSensorConfiguration = @"sensorConfiguration";
static NSString* const kDatasetNameSensor = @"sensor";

@interface SettingsViewController () <DataProviderDelegate>{
    IBOutlet UITableView* tableView_;
    NSArray* sensorTypes_;
    NSUInteger providersExecutionCount_;
    NSMutableDictionary* resultset_;
}

@end

@implementation SettingsViewController

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
    [tableView_ registerNib:[UINib nibWithNibName:@"CheckboxCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CheckboxCellId"];
    [tableView_ registerNib:[UINib nibWithNibName:@"CheckboxOptionalCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CheckboxOptionalCellId"];
    [tableView_ registerNib:[UINib nibWithNibName:@"ReminderCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ReminderCellId"];
    [tableView_ registerNib:[UINib nibWithNibName:@"SwitchCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SwitchCellId"];
    [tableView_ registerNib:[UINib nibWithNibName:@"TextCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TextCellId"];
    [tableView_ registerNib:[UINib nibWithNibName:@"VideoTutorialCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"VideoTutorialCellId"];
    [tableView_ setDataSource:self];
    [tableView_ setDelegate:self];
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
    [[SensorTypeDataProvider sharedInstance] performLoadSensorTypesWithFilter:nil delegate:self userInfo:kDatasetNameSensorType];
    [[SensorConfigurationDataProvider sharedInstance] performLoadConfigurationWithFilter:nil delegate:self userInfo:kDatasetNameSensorConfiguration];
    
    [tableView_ reloadData];
    
}

#pragma mark - UITableViewDataSource
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[self sensorTypeAtIndex:section] name];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SensorTypeEntity* sensortypeentity =[self sensorTypeAtIndex:section];
    return [[sensortypeentity.sensors allObjects] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SensorEntity* sensor = [self sensorAtIndexPath:indexPath];
    BOOL isConfigured = [self isSensorConfigured:sensor];

    CheckboxCell *cell = (CheckboxCell*)[tableView dequeueReusableCellWithIdentifier:@"CheckboxCellId"];
    [cell setTableView:tableView];
    [cell setChecked:isConfigured];
    [cell setName:sensor.name];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self datasetSensorType] count];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {

    //assume, that cell with checkState==YES can't change its checkState;
    
    SensorEntity* sensor = [self sensorAtIndexPath:indexPath];
    SensorTypeEntity* sensorType = [self sensorTypeAtIndex:indexPath.section];
    [self makeConfigurationForSensor:sensor andSensorType:sensorType];
    [tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

#pragma mark - DataProviderDelegate
- (void)provider:(id)dataprovider didFinishExecuteFetchWithResult:(NSArray*)resultArray andError:(NSError*)error userInfo:(id)userInfo{

    [resultset_ setObject:resultArray forKey:userInfo];

    providersExecutionCount_++;
    if (providersExecutionCount_ == 2){
        [tableView_ reloadData];
    }
}

#pragma mark - datasets
- (id)datasetSensorConfiguration {
    return [resultset_ objectForKey:kDatasetNameSensorConfiguration];
}

- (BOOL)isSensorConfigured:(id)sensorID {
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"configurationSensor == %@",sensorID];
    NSArray* configurations = [self datasetSensorConfiguration];
    NSArray* array =  [configurations filteredArrayUsingPredicate:predicate];
    return ([array count] != 0);
}

- (id)datasetSensorType {
    return [resultset_ objectForKey:kDatasetNameSensorType];
}

- (id)sensorTypeAtIndex:(NSInteger)index {
    return [[self datasetSensorType] objectAtIndex:index];
}

- (id)sensorAtIndexPath:(NSIndexPath*)indexPath {
    SensorTypeEntity* sensorType = [self sensorTypeAtIndex:indexPath.section];
    return [[[sensorType sensors] allObjects] objectAtIndex:indexPath.row];
}

- (void)makeConfigurationForSensor:(id)sensor andSensorType:(id)sensorType {
    [[SensorConfigurationDataProvider sharedInstance] addConfigurationWithSensorID:[sensor objectID] andSensorTypeID:[sensorType objectID]];
}
@end
