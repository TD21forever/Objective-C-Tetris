//
//  TetrisButton.m
//  Tetris
//
//  Created by T D on 2022/8/16.
//

#import "TetrisButton.h"
#import "UIColor+TT.h"

@implementation TetrisButton

- (instancetype)initWithType:(NSString*)type{
    if([type isEqualToString:@"red"]){
        self = (TetrisButton*)[UIButton buttonWithType:UIButtonTypeCustom];
        [self setBackgroundImage:[UIImage imageNamed:@"ControlButton"] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:@"ControButtonPressed"] forState:UIControlStateHighlighted];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        return self;
    } else {
        self = (TetrisButton*)[UIButton buttonWithType:UIButtonTypeCustom];
        [self setBackgroundImage:[UIImage imageNamed:@"GreenButton"] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:@"GreenButtonPressed"] forState:UIControlStateHighlighted];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        return self;
    }
    
}

@end
