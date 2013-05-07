//
//  TCProgressView.m
//  TCProgressViewExample
//
//  Created by Thibault Charbonnier on 25/04/13.
//  Copyright (c) 2013 thibaultCha. All rights reserved.
//

#define EPSILON 0.00001f

#import "TCProgressView.h"

@implementation TCProgressView

@synthesize progressLayer = _progressLayer;
@synthesize backgroundLayer = _backgroundLayer;


#pragma mark - Init


- (id)initWithFrame:(CGRect)frame style:(TCProgressViewStyle)style
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundLayer = self.layer;
        
        _progressLayer = [CALayer layer];
        [self.progressLayer setFrame:self.backgroundLayer.bounds];
        [self.backgroundLayer addSublayer:self.progressLayer];
        
        [self setStyle:style];
        
        NSLog(@"end init %@", NSStringFromCGRect(self.progressLayer.frame));
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
              style:(TCProgressViewStyle)style
    backgroundColor:(UIColor *)backgroundColor
   andProgressColor:(UIColor *)progressColor
{
    self = [self initWithFrame:frame style:style];
    
    if (self) {
        [self setBackgroundColor:backgroundColor];
        [self setProgressColor:progressColor];
    }
    
    return self;
}


#pragma mark - Utilities


- (void)setRounded:(BOOL)rounded withRadius:(CGFloat)radius
{
    if (rounded) {
        self.backgroundLayer.cornerRadius = radius;
        self.backgroundLayer.masksToBounds = YES;
    } else {
#warning To improve
        self.backgroundLayer.cornerRadius = 0;
        self.backgroundLayer.masksToBounds = NO;
    }
}

- (void)setProgressRounded:(BOOL)rounded withRadius:(CGFloat)radius
{
#warning To do
}


#pragma mark- Setters


- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    self.backgroundLayer.backgroundColor = [backgroundColor CGColor];
}

- (void)setProgressColor:(UIColor *)progressViewColor
{
    self.progressLayer.backgroundColor = [progressViewColor CGColor];
}

- (void)setStyle:(TCProgressViewStyle)style
{
    _style = style;
    CGRect newFrame = self.backgroundLayer.bounds;
    
    switch (style)
    {
        case TCProgressViewStyleNormal:
        {
            newFrame.origin.x = self.backgroundLayer.bounds.origin.x;
            
            break;
        }
        case TCProgressViewStyleFromCenter:
        {
            newFrame.origin.x = self.backgroundLayer.bounds.size.width / 2;

            break;
        }
        default:
        {
            
            break;
        }
    }
    
    self.progressLayer.frame = newFrame;
    [self setProgress:self.progress];
}

- (void)setProgress:(float)progress
{
    if ( 0.0f - EPSILON < progress && progress < 1.0f + EPSILON ) {
        _progress = progress;

        CGRect oldFrame = self.backgroundLayer.bounds;
        CGRect newFrame = oldFrame;
        newFrame.size.width = self.backgroundLayer.bounds.size.width * progress;
        
        switch (self.style) {
            case TCProgressViewStyleNormal:
                
                break;
            case TCProgressViewStyleFromCenter:
                newFrame.origin.x = (self.backgroundLayer.bounds.size.width / 2) - (newFrame.size.width / 2);
                break;
            default:
                break;
        }
        
        self.progressLayer.frame = newFrame;
        
        CABasicAnimation *progressAnim = [CABasicAnimation animationWithKeyPath:@"progress"];
        progressAnim.fromValue = [NSValue valueWithCGRect:oldFrame];
        progressAnim.toValue = [NSValue valueWithCGRect:newFrame];
        
        [self.progressLayer addAnimation:progressAnim forKey:@"progress"];
    }
}

@end
