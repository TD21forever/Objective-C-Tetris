//
//  BrickPoint.m
//  Tetris
//
//  Created by T D on 2022/8/15.
//

#import "BrickPoint.h"


@implementation BrickPoint

- (instancetype)initWithX:(NSInteger)x withY:(NSInteger)y{
    if(self=[super init]){
        self.x = x;
        self.y = y;
    }
    return self;
}

@end
