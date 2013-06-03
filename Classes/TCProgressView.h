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
    TCProgressViewStyleFromLeftToRight = 0,
    TCProgressViewStyleFromCenter = 1 << 0,
};

@interface TCProgressView : UIView

@property (nonatomic, retain) CALayer *progressLayer;
@property (nonatomic, assign) CALayer *backgroundLayer;
@property (nonatomic, readwrite, setter = setTCProgressViewStyle:) TCProgressViewStyle style;
@property (nonatomic, readwrite, setter = setProgress:) float progress;
@property (nonatomic, readwrite, setter = setCornersRadius:) CGFloat cornersRadius;
@property (nonatomic, readwrite, setter = setRounded:, getter = isRounded) BOOL rounded;

- (id)initWithFrame:(CGRect)frame
              style:(TCProgressViewStyle)style;

- (id)initWithFrame:(CGRect)frame
              style:(TCProgressViewStyle)style
    backgroundColor:(UIColor *)backgroundColor
      progressColor:(UIColor *)progressColor;

/*
 UI settings
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor;
- (void)setProgressColor:(UIColor *)progressViewColor;

@end
