//
//  TCProgressView.m
//  TCProgressViewExample
//
//  Created by Thibault Charbonnier on 25/04/13.
//  Copyright (c) 2013 thibaultCha. All rights reserved.
//

#import "TCProgressView.h"

@implementation TCProgressView

@synthesize progressView = _progressView;
@synthesize backgroundView = _backgroundView;
@synthesize progress = _progress;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _backgroundView = [[UIView alloc] initWithFrame:frame];
        _progressView = [[UIView alloc] initWithFrame:frame];
        
        self.backgroundView.backgroundColor = [UIColor redColor];
        self.progressView.backgroundColor = [UIColor greenColor];
        
        [self addSubview:self.progressView];
        [self addSubview:self.backgroundView];
    }
    
    return self;
}

- (void)setProgress:(float)progress
{
    if ( 0 <= _progress && _progress <= 1 ) {
        _progress = progress;
        float backgroundWidth = self.frame.size.width - self.frame.size.width * progress;
        [UIView animateWithDuration:0.1
                         animations:^{
                             [self.backgroundView setFrame:CGRectMake(self.frame.size.width - backgroundWidth,
                                                                      0,
                                                                      backgroundWidth,
                                                                      self.frame.size.height)];
                        }];
    }
}

@end
