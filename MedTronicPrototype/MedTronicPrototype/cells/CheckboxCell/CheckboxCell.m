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
    accessorOn_ = [CellAccessorsFabric accessorSolidCheckmarkOnWithTarget:nil action:nil];
    accessorOff_ = [CellAccessorsFabric accessorSolidCheckmarkOffWithTarget:self action:@selector(accessorOffTapped:withEvent:)];

    self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;

    self.name = @"";
    self.checked = NO;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setChecked:(BOOL)checked {
    _checked = checked;
    UIView* accessor = _checked?accessorOn_:accessorOff_;
    [accessor setFrame:CGRectMake(0,0,28,28)];
    self.accessoryView = accessor;

}

- (void)setName:(NSString *)name {
    _name = name;
    labelName.text = name;
}



- (void)accessorOnTapped:(UIControl*)button withEvent:(UIEvent*)event {
    
    self.checked = !self.checked;
    
    NSSet *touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:_tableView];
    NSIndexPath *indexPath = [_tableView indexPathForRowAtPoint: currentTouchPosition];
    
    [_tableView.delegate tableView:_tableView accessoryButtonTappedForRowWithIndexPath:indexPath];
}


- (void)accessorOffTapped:(UIControl*)button withEvent:(UIEvent*)event {
    self.checked = !self.checked;
    
    NSSet *touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:_tableView];
    NSIndexPath *indexPath = [_tableView indexPathForRowAtPoint: currentTouchPosition];
    
    [_tableView.delegate tableView:_tableView accessoryButtonTappedForRowWithIndexPath:indexPath];
}

@end
