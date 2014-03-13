//
//  ViewController.h
//  ClickLabelApp
//
//  Created by Christopher Rumpf on 3/12/14.
//  Copyright (c) 2014 Blue Brindle Software, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClickLabel.h"

@interface ViewController : UIViewController <ClickLabelDelegate>

@property (nonatomic, weak) IBOutlet UILabel *tapLabel;
@property (nonatomic, weak) IBOutlet UILabel *tapPointLabel;

@property (nonatomic, strong) ClickLabel *clickLabel;
@property (nonatomic, assign) NSInteger numberOfTaps;

@end
