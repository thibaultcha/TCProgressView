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
	
    // Start Button
    UIButton *startProgress = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [startProgress setFrame:CGRectMake(0, 0, 100.0f, 40.0f)];
    [startProgress setCenter:CGPointMake(self.view.frame.size.width / 2, 40.0f)];
    [startProgress setTitle:@"Start" forState:UIControlStateNormal];
    [startProgress addTarget:self
                      action:@selector(startProgress)
            forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startProgress];
    
    // Progress View
    _progressView = [[TCProgressView alloc] initWithFrame:CGRectMake(0,
                                                                     startProgress.frame.origin.y + startProgress.frame.size.height + 10.0f,
                                                                     self.view.bounds.size.width,
                                                                     10.0f)
                                          backgroundColor:[UIColor redColor]
                                         andProgressColor:[UIColor greenColor]];
    
    [self.view addSubview:self.progressView];
    
    // View
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    [self setProgressView:nil];
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
