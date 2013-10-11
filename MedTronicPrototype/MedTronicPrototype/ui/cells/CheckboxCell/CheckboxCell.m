//
//  CheckboxCell.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/6/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "CheckboxCell.h"
#import "CellAccessorsFabric.h"

@interface CheckboxCell(){
    IBOutlet UILabel* labelName;

    UIButton* accessorOn_;
    UIButton* accessorOff_;
}
@end

@implementation CheckboxCell
@synthesize tableView;
@synthesize name;
@synthesize checked;
@synthesize isMultiSelectAllowed;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //assume, that cell with checkState==YES can't change its checkState;
    accessorOn_ = [CellAccessorsFabric accessorSolidCheckmarkOnWithTarget:self action:@selector(accessorOnTapped:withEvent:)];
    accessorOff_ = [CellAccessorsFabric accessorSolidCheckmarkOffWithTarget:self action:@selector(accessorOffTapped:withEvent:)];

    self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;

    self.name = @"";
    self.checked = NO;
    self.isMultiSelectAllowed = NO;
}

- (void)setEditing:(BOOL)editing {
    [super setEditing:editing];
    [self.accessoryView setHidden:editing];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    [self.accessoryView setHidden:editing];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setChecked:(BOOL)achecked {
    checked = achecked;
    UIView* accessor = checked?accessorOn_:accessorOff_;
    [accessor setFrame:CGRectMake(0,0,28,28)];
    self.accessoryView = accessor;
}

- (void)setName:(NSString *)aname {
    name = aname;
    labelName.text = name;
}



- (void)accessorOnTapped:(UIControl*)button withEvent:(UIEvent*)event {
    
    if (isMultiSelectAllowed){
    
        self.checked = !self.checked;
        
        NSSet *touches = [event allTouches];
        UITouch *touch = [touches anyObject];
        CGPoint currentTouchPosition = [touch locationInView:tableView];
        NSIndexPath *indexPath = [tableView indexPathForRowAtPoint: currentTouchPosition];
        
        [tableView.delegate tableView:tableView accessoryButtonTappedForRowWithIndexPath:indexPath];
    }
}


- (void)accessorOffTapped:(UIControl*)button withEvent:(UIEvent*)event {
    self.checked = !self.checked;
    
    NSSet *touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:tableView];
    NSIndexPath *indexPath = [tableView indexPathForRowAtPoint: currentTouchPosition];
    
    [tableView.delegate tableView:tableView accessoryButtonTappedForRowWithIndexPath:indexPath];
}

@end
