//
//  StartViewController.m
//  WebViewSpike
//
//  Created by Huang Yuqing on 9/24/13.
//  Copyright (c) 2013 YQ. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation StartViewController

- (id)init {
    self = [super init];
    if (self) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 20, 320, 480)];
        _webView.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *httpSource = @"http://www.google.com/";
    NSURL *fullUrl = [NSURL URLWithString:httpSource];
    NSURLRequest *httpRequest = [NSURLRequest requestWithURL:fullUrl];
    [_webView loadRequest:httpRequest];

    [self.view addSubview:_webView];
    

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [webView stringByEvaluatingJavaScriptFromString:@"var script = document.createElement('script');"
     "script.type = 'text/javascript';"
     "script.text = \"function myFunction() { "
     "var btn = document.getElementById('tsbb');"
     "btn.onclick = function(){alert('im here'); window.location.href='msp://www.baidu.com'};"
     "}\";"
     "document.getElementsByTagName('head')[0].appendChild(script);"];
    
    [webView stringByEvaluatingJavaScriptFromString:@"myFunction();"];

}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if ([request.URL.scheme isEqualToString:@"msp"]) {
        NSLog(@"YQ catch the request");
    }
    return YES;
}

@end
