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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        _progressViews = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Start Button
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [startButton setFrame:CGRectMake(0, 0, 100.0f, 40.0f)];
    [startButton setCenter:CGPointMake((self.view.frame.size.width / 3) * 1, 40.0f)];
    [startButton setTitle:@"Start" forState:UIControlStateNormal];
    [startButton addTarget:self
                      action:@selector(startProgress)
            forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];
    
    // Reset button
    UIButton *resetButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [resetButton setFrame:CGRectMake(0, 0, 100.0f, 40.0f)];
    [resetButton setCenter:CGPointMake((self.view.frame.size.width / 3) * 2, 40.0f)];
    [resetButton setTitle:@"Reset" forState:UIControlStateNormal];
    [resetButton addTarget:self
                    action:@selector(resetProgress)
          forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resetButton];
    
    // Progress View
    CGRect progressViewsFrame = CGRectMake(0,
                                           startButton.frame.origin.y +
                                           startButton.frame.size.height + 30.0f,
                                           self.view.bounds.size.width,
                                           10.0f);
    TCProgressView *progressView1 = [[TCProgressView alloc] initWithFrame:progressViewsFrame
                                                                    style:TCProgressViewStyleNormal
                                                          backgroundColor:[UIColor redColor]
                                                         andProgressColor:[UIColor greenColor]];
    [self.progressViews addObject:progressView1];
    [self.view addSubview:progressView1];
    
    progressViewsFrame.origin.y += 30.0f;
    TCProgressView *progressView2 = [[TCProgressView alloc] initWithFrame:progressViewsFrame
                                                                    style:TCProgressViewStyleFromCenter
                                                          backgroundColor:[UIColor redColor]
                                                         andProgressColor:[UIColor greenColor]];
    [self.progressViews addObject:progressView2];
    [self.view addSubview:progressView2];
    
    // View
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self setProgressViews:nil];
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
    for (TCProgressView *progressView in self.progressViews) {
        [progressView setProgress:[progress floatValue]];
    }
}

-(void)resetProgress
{
    for (TCProgressView *progressView in self.progressViews) {
        [progressView setProgress:0];
    }
}

@end
