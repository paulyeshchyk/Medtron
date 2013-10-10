//
//  MYMPumpAndAlarmViewController.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/10/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMPumpAndAlarmViewController.h"
#import "MYMPumpAndSensorAlarmsDataset.h"
#import "MYMPumpAndSensorAlarmTypesDataset.h"
#import "MYMCellProtocols.h"

static NSString* const kCellIdentifier = @"CheckboxCellId";
@interface MYMPumpAndAlarmViewController ()<MYMDatasetDelegate> {
    MYMPumpAndSensorAlarmsDataset* alarmsDataset_;
    MYMPumpAndSensorAlarmTypesDataset* alarmTypesDataset_;
    NSInteger counter_;
}
@property (nonatomic, weak)IBOutlet UISegmentedControl* segmentControl;
@property (nonatomic, weak)IBOutlet UITableView* tableView;
@property (nonatomic, strong)NSManagedObjectID* alarmTypeID;
@end

@implementation MYMPumpAndAlarmViewController

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

    counter_ = 0;
    
    alarmTypesDataset_ =[MYMPumpAndSensorAlarmTypesDataset new];
    alarmTypesDataset_.delegate = self;
    alarmTypesDataset_.userInfo = @"MYMPumpAndSensorAlarmTypesDataset";
    [alarmTypesDataset_ reloadData];
    
    [self.segmentControl addTarget:self action:@selector(onSegmentEventValueChanged:forEvent:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView*)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath*)indexPath {
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [[[UIAlertView alloc] initWithTitle:@"Stub" message:@"showing explanation" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil] show];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [alarmsDataset_ numberOfRowsInSection:section];
}
- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section {
    return [alarmsDataset_ sectionAtIndex:section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [alarmsDataset_ sectionsCount];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* alarmName = [alarmsDataset_ alarmNameAtIndexPath:indexPath];
    
    UITableViewCell<CheckboxCellProtocol>* cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    [cell setTableView:tableView];
    [cell setName:alarmName];
    return cell;
}

- (void)willStartLoadDataset:(MYMDataset*)dataset {
    
}

- (void)didEndLoadDataset:(MYMDataset*)dataset {
    if ([dataset.userInfo isEqualToString:@"MYMPumpAndSensorAlarmTypesDataset"]){

        [self.segmentControl removeAllSegments];
        
        MYMPumpAndSensorAlarmTypesDataset* ds = (MYMPumpAndSensorAlarmTypesDataset*)dataset;
        if ([ds numberOfRowsInSection:0] > 0){

            self.alarmTypeID = [ds objectAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
            
            for(int i=0;i<[ds numberOfRowsInSection:0];i++) {
                NSString* segmentName = [[ds objectAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]] name];
                [self.segmentControl insertSegmentWithTitle:segmentName atIndex:i animated:NO];
            }
        }
        
    } else if ([dataset.userInfo isEqualToString:@"MYMPumpAndSensorAlarmsDataset"]){
        
        [self.tableView reloadData];
    }
    
}


- (void)setAlarmTypeID:(NSManagedObjectID *)alarmTypeID {
    _alarmTypeID = alarmTypeID;

    alarmsDataset_ = [MYMPumpAndSensorAlarmsDataset new];
    alarmsDataset_.delegate = self;
    alarmsDataset_.userInfo = @"MYMPumpAndSensorAlarmsDataset";
    [alarmsDataset_ setAlarmTypeObjectID:_alarmTypeID];
    [alarmsDataset_ reloadData];
    
}

- (void)onSegmentEventValueChanged:(id)sender forEvent:(UIEvent *)event{
    NSManagedObjectID* selectedType = [[alarmTypesDataset_ objectAtIndexPath:[NSIndexPath indexPathForRow:self.segmentControl.selectedSegmentIndex inSection:0]] objectID];
    self.alarmTypeID = selectedType;
}

@end
