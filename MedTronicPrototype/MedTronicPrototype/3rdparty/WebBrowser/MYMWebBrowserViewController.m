//
//  MYMTipsExplanationViewController.m
//  MedTronicPrototype
//
//  Created by Pavel on 10/12/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MYMWebBrowserViewController.h"
#import "BarButtonItemWithActivityIndicator.h"

@interface MYMWebBrowserViewController () {
    UIBarButtonItem* toolBarItemPrev_;
    UIBarButtonItem* toolBarItemHome_;
    UIBarButtonItem* toolBarItemNext_;
    BarButtonItemWithActivityIndicator* toolBarItemRefr_;
    BOOL wasToolbarHidden_;
    BOOL isPlainText_;
}
@property (nonatomic, weak)IBOutlet UIWebView* webView;
@end

@implementation MYMWebBrowserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _useDynamicTitle = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    toolBarItemPrev_ = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Arrows-Left-icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(onPrevClicked:)];
    toolBarItemHome_ = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Basic-Home-icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(onHomeClicked:)];
    toolBarItemNext_ = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Arrows-Right-icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(onNextClicked:)];
    toolBarItemRefr_ = [[BarButtonItemWithActivityIndicator alloc] initWithActivityIndicatorAndSender:self selector:@selector(onRefrClicked:)];
    wasToolbarHidden_ =   self.navigationController.toolbarHidden;

    [self reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self updateView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setToolbarHidden:wasToolbarHidden_ animated:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateView {
    if ([self isViewLoaded]){
        isPlainText_ = (self.urlString == nil);
        if (!isPlainText_){
            UIViewController* tBOwner = (_toolBarOwner==nil)?self:_toolBarOwner;
            
            tBOwner.toolbarItems = @[ [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],toolBarItemPrev_,toolBarItemHome_,toolBarItemNext_,toolBarItemRefr_];
            tBOwner.navigationController.toolbarHidden = NO;
        } else {
            
            UIViewController* tBOwner = (_toolBarOwner==nil)?self:_toolBarOwner;
            tBOwner.toolbarItems = nil;
            tBOwner.navigationController.toolbarHidden = YES;
        }
    }
    
}

- (void)reloadData {
    isPlainText_ = (self.urlString == nil);
    if (!isPlainText_){
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]]];
    } else {
        [self.webView loadHTMLString:self.text baseURL:nil];
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


- (void)onPrevClicked:(id)sender {
    [self.webView goBack];
}

- (void)onHomeClicked:(id)sender {
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]]];
}

- (void)onNextClicked:(id)sender {
    [self.webView goForward];
}

- (void)onRefrClicked:(id)sender {
    [self.webView reload];
}
#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [toolBarItemRefr_ setInProgress:YES];
    [toolBarItemPrev_ setEnabled:[webView canGoBack]];
    [toolBarItemNext_ setEnabled:[webView canGoForward]];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [toolBarItemRefr_ setInProgress:NO];
    [toolBarItemPrev_ setEnabled:[webView canGoBack]];
    [toolBarItemNext_ setEnabled:[webView canGoForward]];
    self.title = [self generateTitle];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [toolBarItemPrev_ setEnabled:[webView canGoBack]];
    [toolBarItemNext_ setEnabled:[webView canGoForward]];
    [toolBarItemRefr_ setEnabled:YES];
    self.title = [self generateTitle];
}

- (NSString*)generateTitle {
    NSString* result = self.title;
    
    if (!isPlainText_){
        if (_useDynamicTitle) {
            result = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
        }
    }
    return result;
}

@end
