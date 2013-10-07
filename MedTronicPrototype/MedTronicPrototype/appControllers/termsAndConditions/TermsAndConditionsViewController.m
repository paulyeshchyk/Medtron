//
//  TermsAndConditionsViewController.m
//  MedTronicPrototype
//
//  Created by Pavel Yeshchyk on 9/24/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "TermsAndConditionsViewController.h"
#import "UserStandardDefaultsManager.h"

@interface TermsAndConditionsViewController ()
- (IBAction)onAcceptButtonClicked:(id)sender;
@end

@implementation TermsAndConditionsViewController

+(void)navigationController:(UINavigationController*)navController askUserToAcceptText:(CloseActionBlock)block {
    if ([[UserStandardDefaultsManager sharedInstance] userHasReadTerms]){
        if(block != NULL){
            block(nil,YES,NO);
        }
    } else {
        TermsAndConditionsViewController* termsController = [[TermsAndConditionsViewController alloc] initWithNibName:@"TermsAndConditionsViewController" bundle:nil];
        
        [termsController setOnCloseBlock:^(id sender, BOOL accepted, BOOL wasFirstTime){
            [[UserStandardDefaultsManager sharedInstance] setUserHasReadTerms:accepted];
            [sender dismissViewControllerAnimated:NO completion:NULL];

            if(block != NULL){
                block(sender,accepted,wasFirstTime);
            }
            
        }];
        
        [navController presentViewController:termsController animated:NO completion:NULL];
    }
    
}

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onAcceptButtonClicked:(id)sender {
    if (_onCloseBlock != NULL){
        _onCloseBlock(self, YES,YES);
    }
    
}
@end
