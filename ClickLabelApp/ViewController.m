//
//  ViewController.m
//  ClickLabelApp
//
//  Created by Christopher Rumpf on 3/12/14.
//  Copyright (c) 2014 Blue Brindle Software, Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _numberOfTaps = 0;
    
    [self setClickLabel:[[ClickLabel alloc] initWithFrame:CGRectMake(20.0, 44.0, CGRectGetWidth(self.view.bounds) - 40.0,  44.0)]];
    [_clickLabel setDelegate:self];
    [_clickLabel setText:@"Tap Me."];
    [_clickLabel setBackgroundColor:[UIColor orangeColor]];
    [_clickLabel setTextAlignment:NSTextAlignmentCenter];
    
    [_tapLabel setText:@"Try tapping the orange label."];
    [_tapPointLabel setText:nil];
        
    [self.view addSubview:_clickLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ClickLabelDelegate

- (void)didTapClickLabel:(ClickLabel *)clickLabel {
    if (clickLabel == _clickLabel) {
        _numberOfTaps++;
        
        [_clickLabel setClickLabelFormat:(_numberOfTaps & 0x1) ? ClickLabelFormatUnderline : ClickLabelFormatNormal];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setFormatterBehavior:NSDateFormatterBehavior10_4];
        [formatter setDateFormat:@"HH:mm:ss"];

        [_tapLabel setText:[NSString stringWithFormat:@"Tapped %d times. Last at %@.", _numberOfTaps, [formatter stringFromDate:[NSDate date]]]];
    }
}

- (void)clickLabel:(ClickLabel *)clickLabel tappedAtPoint:(CGPoint)tapPoint {
    if (clickLabel == _clickLabel) {
        [_tapPointLabel setText:NSStringFromCGPoint(tapPoint)];
    }
}

@end
