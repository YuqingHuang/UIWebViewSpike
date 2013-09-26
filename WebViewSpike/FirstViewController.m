//
//  FirstViewController.m
//  WebViewSpike
//
//  Created by Huang Yuqing on 9/24/13.
//  Copyright (c) 2013 YQ. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation FirstViewController {
    UIActivityIndicatorView *activityView;
}

- (void)viewDidLoad
{
    [self initFields];
    [super viewDidLoad];
}

- (void)initFields {
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 20, 320, 480)];
    _webView.delegate = self;
    
    activityView=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityView.frame = CGRectMake(0, 0, 320, 480);
    activityView.backgroundColor = [UIColor whiteColor];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    activityView.center=self.view.center;
    activityView.hidesWhenStopped = YES;
    
    [activityView startAnimating];

    [self.view addSubview:activityView];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString *javascript = @"document.getElementById('lc_FirstName').value = 'Y66';"
                            "document.getElementById('lc_LastName').value = 'Y66';"
                            "document.getElementById('lc_EmailAddress').value = 'Y5@TEST.COM';";
    
    [_webView stringByEvaluatingJavaScriptFromString:javascript];
    [_webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('lc_submit').click()"];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {

    if ([request.URL.absoluteString hasPrefix:@"https://fls.doubleclick.net"] && ![activityView isHidden]) {
        [activityView stopAnimating];
    }
    NSLog(@"request: %@", request.URL);
    return YES;
}

- (IBAction)launchLC:(id)sender {
    NSString *httpSource = @"https://livechat.telstra.com/TCOM:Mobile:App:DataPack";
    NSURL *fullUrl = [NSURL URLWithString:httpSource];
    NSURLRequest *httpRequest = [NSURLRequest requestWithURL:fullUrl];
    
    [_webView loadRequest:httpRequest];
    _webView.scalesPageToFit = YES;
    [self.view addSubview:_webView];
}
@end
