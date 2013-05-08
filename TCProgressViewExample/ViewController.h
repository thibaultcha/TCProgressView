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
@property (weak, nonatomic) IBOutlet UISlider *stepsSlider;
@property (weak, nonatomic) IBOutlet UISlider *speedSlider;

- (IBAction)startProgess;

- (IBAction)resetProgress;

- (void)updateProgress:(NSNumber *)progress;

@end
