//
//  ClickLabelDelegate.h
//  ClickLabelApp
//
//  Created by Christopher Rumpf on 3/12/14.
//  Copyright (c) 2014 Blue Brindle Software, Inc. All rights reserved.
//

typedef NS_ENUM(NSUInteger, ClickLabelFormat) {
    ClickLabelFormatNormal,
    ClickLabelFormatUnderline
};

@class ClickLabel;

@protocol ClickLabelDelegate <NSObject>

@optional

- (void)didTapClickLabel:(ClickLabel *)clickLabel;

- (void)clickLabel:(ClickLabel *)clickLabel tappedAtPoint:(CGPoint)tapPoint;

@end