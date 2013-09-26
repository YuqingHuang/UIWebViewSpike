//
//  SecondViewController.m
//  WebViewSpike
//
//  Created by Huang Yuqing on 9/26/13.
//  Copyright (c) 2013 YQ. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation SecondViewController {
    UIActivityIndicatorView *activityView;
}

- (void)viewDidLoad
{
    [self initFields];
    [super viewDidLoad];
    NSString *httpSource = @"https://www.google.com";
    NSURL *fullUrl = [NSURL URLWithString:httpSource];
    NSURLRequest *httpRequest = [NSURLRequest requestWithURL:fullUrl];
    
    [_webView loadRequest:httpRequest];
    _webView.scalesPageToFit = YES;
    [self.view addSubview:_webView];
}

- (void)initFields {
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 20, 320, 480)];
    _webView.delegate = self;
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //    [webView stringByEvaluatingJavaScriptFromString:@"var script = document.createElement('script');"
    //     "script.type = 'text/javascript';"
    //     "script.text = \"function myFunction() { "
    //     "var btn = document.getElementById('tsbb');"
    //     "btn.onclick = function(){alert('im here'); window.location.href='msp://www.baidu.com'};"
    //     "}\";"
    //     "document.getElementsByTagName('head')[0].appendChild(script);"];
    
       [webView stringByEvaluatingJavaScriptFromString:@"myFunction();"];
       [_webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('tsbb').onclick = function(){alert('im here'); window.location.href='msp://www.baidu.com'};"];
   
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if ([request.URL.scheme isEqualToString:@"msp"]) {
        NSLog(@"YQ catch the request");
    }
    NSLog(@"request: %@", request.URL);
    return YES;
}

@end
