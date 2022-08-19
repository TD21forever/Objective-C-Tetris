//
//  Brick.m
//  Tetris
//
//  Created by T D on 2022/8/13.
//

#import "BrickView.h"
#import "UIColor+TT.h"

@implementation BrickView

- (instancetype)initWithFrame:(CGRect)frame point:(BrickPoint*)point {
    if(self = [super initWithFrame:frame]){
        self.point = point;
        self.backgroundColor = [UIColor colorWithHex:@"#293029"];
        self.layer.borderWidth = 0.3;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return self;
}

@end

