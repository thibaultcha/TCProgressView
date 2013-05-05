//
//  ViewController.m
//  TCProgressViewExample
//
//  Created by Thibault Charbonnier on 25/04/13.
//  Copyright (c) 2013 thibaultCha. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Progress View
    _progressView = [[TCProgressView alloc] initWithFrame:CGRectMake(0,
                                                                     0,
                                                                     self.view.bounds.size.width,
                                                                     10.0f)];
    [self.view addSubview:self.progressView];
    
    // Start Button
    UIButton *startProgress = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [startProgress setFrame:CGRectMake(0,
                                       10.0f,
                                       100.0f,
                                       40.0f)];
    [startProgress setTitle:@"Start" forState:UIControlStateNormal];
    [startProgress addTarget:self
                      action:@selector(startProgress)
            forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startProgress];
    
    // View
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startProgress
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        float progress = 0;
        while (progress <= 1.0f) {
            progress += 0.1;
            [self performSelectorOnMainThread:@selector(updateProgress:)
                                   withObject:[NSNumber numberWithFloat:progress]
                                waitUntilDone:YES];
            [NSThread sleepForTimeInterval:0.3];
        }
    });
}
             
- (void)updateProgress:(NSNumber *)progress
{
    [self.progressView setProgress:[progress floatValue]];
}

@end
