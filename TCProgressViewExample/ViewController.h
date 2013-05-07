//
//  ViewController.h
//  TCProgressViewExample
//
//  Created by Thibault Charbonnier on 25/04/13.
//  Copyright (c) 2013 thibaultCha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCProgressView.h"

@interface ViewController : UIViewController

@property (retain, nonatomic) NSMutableArray *progressViews;

- (void)startProgress;

- (void)updateProgress:(NSNumber *)progress;

- (void)resetProgress;

@end
