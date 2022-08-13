//
//  Brick.m
//  Tetris
//
//  Created by T D on 2022/8/13.
//

#import "BrickView.h"

@implementation BrickView

- (instancetype)initWithFrame:(CGRect)frame point:(BrickPoint*)point {
    if(self = [super initWithFrame:frame]){
        self.point = point;
        self.backgroundColor = [UIColor blackColor];
        self.layer.borderWidth = 0.5;
    }
    return self;
}

- (NSArray*)getBrickPoints:(BrickType)type{
    NSMutableArray* brickPoints = [NSMutableArray array];
    BrickPoint * point1;
    BrickPoint * point2;
    BrickPoint * point3;
    BrickPoint * point4;
    switch (type) {
        case BrickTypeI:
            point1 = [[BrickPoint alloc]initWithX:0 withY:-1];
            point2 = [[BrickPoint alloc]initWithX:1 withY:-1];
            point3 = [[BrickPoint alloc]initWithX:2 withY:-1];
            point4 = [[BrickPoint alloc]initWithX:3 withY:-1];
            break;
        case BrickTypeIR:
            point1 = [[BrickPoint alloc]initWithX:0 withY:-4];
            point2 = [[BrickPoint alloc]initWithX:0 withY:-3];
            point3 = [[BrickPoint alloc]initWithX:0 withY:-2];
            point4 = [[BrickPoint alloc]initWithX:0 withY:-1];
            break;
        default:
            break;
    }
    [brickPoints addObject:point1];
    [brickPoints addObject:point2];
    [brickPoints addObject:point3];
    [brickPoints addObject:point4];
    return brickPoints;
}



@end


@implementation BrickPoint

- (instancetype)initWithX:(NSInteger)x withY:(NSInteger)y{
    if(self=[super init]){
        self.x = x;
        self.y = y;
    }
    return self;
}

@end

