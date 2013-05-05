//
//  TCProgressView.h
//  TCProgressViewExample
//
//  Created by Thibault Charbonnier on 25/04/13.
//  Copyright (c) 2013 thibaultCha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCProgressView : UIView

@property (nonatomic, retain) UIView *progressView;
@property (nonatomic, retain) UIView *backgroundView;
@property (nonatomic, setter = setProgress:) float progress;

- (id)initWithFrame:(CGRect)frame;

- (void)setBackgroundViewColor:(UIColor *)backgroundColor;

- (void)setProgressViewColor:(UIColor *)progressViewColor;

- (void)setProgress:(float)progress;

@end
