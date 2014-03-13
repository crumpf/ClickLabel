//
//  ClickLabel.h
//  ClickLabelApp
//
//  Created by Christopher Rumpf on 3/12/14.
//  Copyright (c) 2014 Blue Brindle Software, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClickLabelDelegate.h"

@interface ClickLabel : UILabel

@property (nonatomic, weak) id <ClickLabelDelegate> delegate;

@property (nonatomic, assign) ClickLabelFormat clickLabelFormat;

@end
