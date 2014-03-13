//
//  ClickLabel.m
//  ClickLabelApp
//
//  Created by Christopher Rumpf on 3/12/14.
//  Copyright (c) 2014 Blue Brindle Software, Inc. All rights reserved.
//

#import "ClickLabel.h"

@interface ClickLabel ()

@property (nonatomic, strong) UIColor *previousColor;

@end

@implementation ClickLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self clickLabelDidInit];
    }
    return self;
}

- (void)clickLabelDidInit {
    [self setUserInteractionEnabled:YES];
    [self setClickLabelFormat:ClickLabelFormatNormal];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    // Drawing code
    if (ClickLabelFormatUnderline == _clickLabelFormat ) {
        CGRect textRect = [self textRectForBounds:self.bounds limitedToNumberOfLines:1];
        
        CGContextRef ctxt = UIGraphicsGetCurrentContext();
        CGFloat maxY = CGRectGetHeight(self.bounds) - (CGRectGetHeight(self.bounds) - CGRectGetHeight(textRect)) / 2.0; // textRectForBounds reports y-origin at 0 so we can't just use CGRectGetMaxY
        CGContextMoveToPoint(ctxt, CGRectGetMinX(textRect), maxY);
        CGContextAddLineToPoint(ctxt, CGRectGetMaxX(textRect), maxY);
        CGContextSetLineWidth(ctxt, 1.0);
        CGContextSetStrokeColorWithColor(ctxt, [[UIColor blackColor] CGColor]);
        CGContextStrokePath(ctxt);
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    UITouch *touch = [touches anyObject];
    if ([touch view] == self) {
        _previousColor = self.backgroundColor;
        [self setBackgroundColor:[UIColor yellowColor]];

        if ([_delegate respondsToSelector:@selector(didTapClickLabel:)]) {
            [_delegate didTapClickLabel:self];
        }
        
        if ([_delegate respondsToSelector:@selector(clickLabel:tappedAtPoint:)]) {
            [_delegate clickLabel:self tappedAtPoint:[touch locationInView:self]];
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self setBackgroundColor:_previousColor];
}

@end
