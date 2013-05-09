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


#pragma mark- Setters



- (void)setRounded:(BOOL)rounded
{
    _rounded = rounded;
    
    if (rounded) {
        self.backgroundLayer.cornerRadius = self.round;
        self.progressLayer.cornerRadius = self.round;
        self.backgroundLayer.masksToBounds = YES;
        self.progressLayer.masksToBounds = YES;
    } else {
        self.backgroundLayer.cornerRadius = 0;
        self.progressLayer.cornerRadius = 0;
        self.backgroundLayer.masksToBounds = NO;
        self.progressLayer.masksToBounds = NO;
    }
}

- (void)setRound:(CGFloat)round
{
    _round = round;
    
    if (self.rounded) {
        [self setRounded:self.rounded];
    }
}

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
    
    switch (style) {
        case TCProgressViewStyleFromLeftToRight:
            newFrame.origin.x = self.backgroundLayer.bounds.origin.x;
            break;
        case TCProgressViewStyleFromCenter:
            newFrame.origin.x = self.backgroundLayer.bounds.size.width / 2;
            break;
        default:
            break;
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
            case TCProgressViewStyleFromLeftToRight:
                
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
