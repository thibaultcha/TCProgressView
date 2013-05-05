//
//  TCProgressView.m
//  TCProgressViewExample
//
//  Created by Thibault Charbonnier on 25/04/13.
//  Copyright (c) 2013 thibaultCha. All rights reserved.
//

#import "TCProgressView.h"

@implementation TCProgressView

@synthesize backgroundView = _backgroundView;
@synthesize progress = _progress;


#pragma mark - Init


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
        
        [self addSubview:self.backgroundView];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
    backgroundColor:(UIColor *)backgroundColor
   andProgressColor:(UIColor *)progressColor
{
    self = [self initWithFrame:frame];
    
    if (self) {
        [self setBackgroundViewColor:backgroundColor];
        [self setProgressViewColor:progressColor];
    }
    
    return self;
}


#pragma mark - Utilities


- (void)setRounded:(BOOL)rounded withRadius:(CGFloat)radius
{
    if (rounded) {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
    } else {
#warning To improve
        self.layer.cornerRadius = 0.0f;
        self.layer.masksToBounds = NO;
    }
}

- (void)setProgressViewRounded:(BOOL)rounded withRadius:(CGFloat)radius
{
#warning To do
}


#pragma mark- Setters


- (void)setBackgroundViewColor:(UIColor *)backgroundColor
{
    self.backgroundView.backgroundColor = backgroundColor;
}

- (void)setProgressViewColor:(UIColor *)progressViewColor
{
    self.backgroundColor = progressViewColor;
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
