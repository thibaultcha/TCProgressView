//
//  TCProgressView.h
//  TCProgressViewExample
//
//  Created by Thibault Charbonnier on 25/04/13.
//  Copyright (c) 2013 thibaultCha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface TCProgressView : UIView

@property (nonatomic, retain) UIView *backgroundView;
@property (nonatomic, setter = setProgress:) float progress;

- (id)initWithFrame:(CGRect)frame;

- (id)initWithFrame:(CGRect)frame
    backgroundColor:(UIColor *)backgroundColor
   andProgressColor:(UIColor *)progressColor;

- (void)setBackgroundViewColor:(UIColor *)backgroundColor;

- (void)setProgressViewColor:(UIColor *)progressViewColor;

- (void)setProgress:(float)progress;

- (void)setRounded:(BOOL)rounded withRadius:(CGFloat)radius;

- (void)setProgressViewRounded:(BOOL)rounded withRadius:(CGFloat)radius;

@end
