//
//  MYMTipsExplanationViewController.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/12/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMTipsExplanationViewController.h"

@interface MYMTipsExplanationViewController ()
@property (nonatomic, weak)IBOutlet UIWebView* webView;
@end

@implementation MYMTipsExplanationViewController

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
    
    [self updateView];
    
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStyleBordered target:self action:@selector(onCloseClicked:)]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateView {
    if ([self isViewLoaded]){
        if (self.urlString != nil){
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]]];
        } else {
            [self.webView loadHTMLString:self.text baseURL:nil];
        }
    }
    
}
- (void)onCloseClicked:(id)sender {
    if (self.closeBlock != NULL){
        self.closeBlock(self);
    }
}

- (void)setText:(NSString *)text {
    _text = text;
    [self updateView];
}

- (void)setUrlString:(NSString *)urlString {
    _urlString = urlString;
    [self updateView];
}
@end
