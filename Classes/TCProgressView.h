//
//  TCProgressView.h
//  TCProgressViewExample
//
//  Created by Thibault Charbonnier on 25/04/13.
//  Copyright (c) 2013 thibaultCha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

typedef NS_OPTIONS(NSUInteger, TCProgressViewStyle) {
    TCProgressViewStyleNormal = 0,
    TCProgressViewStyleFromCenter = 1 << 0,
};

@interface TCProgressView : UIView

@property (nonatomic, assign) CALayer *progressLayer;
@property (nonatomic, retain) CALayer *backgroundLayer;
@property (nonatomic, readwrite, setter = setTCProgressViewStyle:) TCProgressViewStyle style;
@property (nonatomic, setter = setProgress:) float progress;

- (id)initWithFrame:(CGRect)frame style:(TCProgressViewStyle)style;

- (id)initWithFrame:(CGRect)frame
              style:(TCProgressViewStyle)style
    backgroundColor:(UIColor *)backgroundColor
   andProgressColor:(UIColor *)progressColor;

- (void)setStyle:(TCProgressViewStyle)style;

- (void)setProgress:(float)progress;

/*
  UI settings
*/
- (void)setBackgroundColor:(UIColor *)backgroundColor;

- (void)setProgressColor:(UIColor *)progressViewColor;

- (void)setRounded:(BOOL)rounded withRadius:(CGFloat)radius;

- (void)setProgressRounded:(BOOL)rounded withRadius:(CGFloat)radius;

@end
