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
    
    // Progress Views
    CGRect progressViewsFrame = CGRectMake(10.0f,
                                           130.0f,
                                           300.0f,
                                           20.0f);

    TCProgressView *progressView1 = [[TCProgressView alloc] initWithFrame:progressViewsFrame
                                                                    style:TCProgressViewStyleFromLeftToRight
                                                          backgroundColor:[UIColor redColor]
                                                            progressColor:[UIColor greenColor]];
    progressView1.rounded = YES;
    progressView1.cornersRadius = 8.0f;
    [self.progressViews addObject:progressView1];
    [self.view addSubview:progressView1];
    
    progressViewsFrame.origin.y += 30.0f;
    progressViewsFrame.size.height += 20.0f;
    TCProgressView *progressView2 = [[TCProgressView alloc] initWithFrame:progressViewsFrame
                                                                    style:TCProgressViewStyleFromCenter
                                                          backgroundColor:[UIColor yellowColor]
                                                            progressColor:[UIColor blueColor]];
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

- (IBAction)startProgess
{  
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        float progress = 0;
        while (progress <= 1.0f) {                
            progress += 1 / self.stepsSlider.value;
            [self performSelectorOnMainThread:@selector(updateProgress:)
                                   withObject:[NSNumber numberWithFloat:progress]
                                waitUntilDone:YES];
            [NSThread sleepForTimeInterval:self.speedSlider.value / 10];
        }
    });
}
             
- (void)updateProgress:(NSNumber *)progress
{
    for (TCProgressView *progressView in self.progressViews) {
        [progressView setProgress:[progress floatValue]];
    }
}

- (IBAction)resetProgress
{
    for (TCProgressView *progressView in self.progressViews) {
        [progressView setProgress:0];
    }
}

@end
