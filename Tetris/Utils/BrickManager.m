//
//  Brick.m
//  Tetris
//
//  Created by T D on 2022/8/13.
//

#import "BrickManager.h"

@implementation BrickManager

+ (instancetype)shared{
    static id _shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _shared = [[self alloc]init];
    });
    return _shared;
}
- (NSInteger)getBricksWidth:(BrickType)type{
    NSArray<BrickPoint*>* points = [self getBrickPoints:type];
    __block NSInteger w = 0;
    [points enumerateObjectsUsingBlock:^(BrickPoint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            w = MAX(obj.x, w);
    }];
    return w;
}
- (NSArray*)getBrickPoints:(BrickType)type{
    NSMutableArray* brickPoints = [NSMutableArray array];
    BrickPoint * point1;
    BrickPoint * point2;
    BrickPoint * point3;
    BrickPoint * point4;
    switch (type) {
        case BrickTypeI:
        {
            point1 = [[BrickPoint alloc]initWithX:0 withY:-1];
            point2 = [[BrickPoint alloc]initWithX:1 withY:-1];
            point3 = [[BrickPoint alloc]initWithX:2 withY:-1];
            point4 = [[BrickPoint alloc]initWithX:3 withY:-1];
        }
            break;
            
        case BrickTypeIR:
        {
            point1 = [[BrickPoint alloc] initWithX:0 withY:-4];
            point2 = [[BrickPoint alloc] initWithX:0 withY:-3];
            point3 = [[BrickPoint alloc] initWithX:0 withY:-2];
            point4 = [[BrickPoint alloc] initWithX:0 withY:-1];
        }
            break;
            
        case BrickTypeL:
        {
            point1 = [[BrickPoint alloc] initWithX:0 withY:-3];
            point2 = [[BrickPoint alloc] initWithX:0 withY:-2];
            point3 = [[BrickPoint alloc] initWithX:0 withY:-1];
            point4 = [[BrickPoint alloc] initWithX:1 withY:-1];
        }
            break;
            
        case BrickTypeLR:
        {
            point1 = [[BrickPoint alloc] initWithX:0 withY:-1];
            point2 = [[BrickPoint alloc] initWithX:1 withY:-3];
            point3 = [[BrickPoint alloc] initWithX:1 withY:-2];
            point4 = [[BrickPoint alloc] initWithX:1 withY:-1];
        }
            break;
            
        case BrickTypeO:
        {
            point1 = [[BrickPoint alloc] initWithX:0 withY:-2];
            point2 = [[BrickPoint alloc] initWithX:0 withY:-1];
            point3 = [[BrickPoint alloc] initWithX:1 withY:-2];
            point4 = [[BrickPoint alloc] initWithX:1 withY:-1];
        }
            break;
            
        case BrickTypeT:
        {
            point1 = [[BrickPoint alloc] initWithX:0 withY:-2];
            point2 = [[BrickPoint alloc] initWithX:1 withY:-2];
            point3 = [[BrickPoint alloc] initWithX:1 withY:-1];
            point4 = [[BrickPoint alloc] initWithX:2 withY:-2];
        }
            break;
            
        case BrickTypeZ:
        {
            point1 = [[BrickPoint alloc] initWithX:0 withY:-2];
            point2 = [[BrickPoint alloc] initWithX:1 withY:-2];
            point3 = [[BrickPoint alloc] initWithX:1 withY:-1];
            point4 = [[BrickPoint alloc] initWithX:2 withY:-1];
        }
            break;
            
        case BrickTypeZR:
        {
            point1 = [[BrickPoint alloc] initWithX:0 withY:-1];
            point2 = [[BrickPoint alloc] initWithX:1 withY:-2];
            point3 = [[BrickPoint alloc] initWithX:1 withY:-1];
            point4 = [[BrickPoint alloc] initWithX:2 withY:-2];
        }
            break;
            
        case BrickTypeL1:
        {
            point1 = [[BrickPoint alloc] initWithX:0 withY:-2];
            point2 = [[BrickPoint alloc] initWithX:0 withY:-1];
            point3 = [[BrickPoint alloc] initWithX:1 withY:-2];
            point4 = [[BrickPoint alloc] initWithX:2 withY:-2];
        }
            break;
            
        case BrickTypeL2:
        {
            point1 = [[BrickPoint alloc] initWithX:0 withY:-3];
            point2 = [[BrickPoint alloc] initWithX:1 withY:-3];
            point3 = [[BrickPoint alloc] initWithX:1 withY:-2];
            point4 = [[BrickPoint alloc] initWithX:1 withY:-1];
        }
            break;
            
        case BrickTypeL3:
        {
            point1 = [[BrickPoint alloc] initWithX:0 withY:-1];
            point2 = [[BrickPoint alloc] initWithX:1 withY:-1];
            point3 = [[BrickPoint alloc] initWithX:2 withY:-2];
            point4 = [[BrickPoint alloc] initWithX:2 withY:-1];
        }
            break;
            
        case BrickTypeLR1:
        {
            point1 = [[BrickPoint alloc] initWithX:0 withY:-2];
            point2 = [[BrickPoint alloc] initWithX:0 withY:-1];
            point3 = [[BrickPoint alloc] initWithX:1 withY:-1];
            point4 = [[BrickPoint alloc] initWithX:2 withY:-1];
        }
            break;
            
        case BrickTypeLR2:
        {
            point1 = [[BrickPoint alloc] initWithX:0 withY:-3];
            point2 = [[BrickPoint alloc] initWithX:0 withY:-2];
            point3 = [[BrickPoint alloc] initWithX:0 withY:-1];
            point4 = [[BrickPoint alloc] initWithX:1 withY:-3];
        }
            break;
            
        case BrickTypeLR3:
        {
            point1 = [[BrickPoint alloc] initWithX:0 withY:-2];
            point2 = [[BrickPoint alloc] initWithX:1 withY:-2];
            point3 = [[BrickPoint alloc] initWithX:2 withY:-2];
            point4 = [[BrickPoint alloc] initWithX:2 withY:-1];
        }
            break;
            
        case BrickTypeT1:
        {
            point1 = [[BrickPoint alloc] initWithX:0 withY:-2];
            point2 = [[BrickPoint alloc] initWithX:1 withY:-3];
            point3 = [[BrickPoint alloc] initWithX:1 withY:-2];
            point4 = [[BrickPoint alloc] initWithX:1 withY:-1];
        }
            break;
            
        case BrickTypeT2:
        {
            point1 = [[BrickPoint alloc] initWithX:0 withY:-1];
            point2 = [[BrickPoint alloc] initWithX:1 withY:-2];
            point3 = [[BrickPoint alloc] initWithX:1 withY:-1];
            point4 = [[BrickPoint alloc] initWithX:2 withY:-1];
        }
            break;
            
        case BrickTypeT3:
        {
            point1 = [[BrickPoint alloc] initWithX:0 withY:-3];
            point2 = [[BrickPoint alloc] initWithX:0 withY:-2];
            point3 = [[BrickPoint alloc] initWithX:0 withY:-1];
            point4 = [[BrickPoint alloc] initWithX:1 withY:-2];
        }
            break;
            
        case BrickTypeZ1:
        {
            point1 = [[BrickPoint alloc] initWithX:0 withY:-2];
            point2 = [[BrickPoint alloc] initWithX:0 withY:-1];
            point3 = [[BrickPoint alloc] initWithX:1 withY:-3];
            point4 = [[BrickPoint alloc] initWithX:1 withY:-2];
        }
            break;
            
        case BrickTypeZR1:
        {
            point1 = [[BrickPoint alloc] initWithX:0 withY:-3];
            point2 = [[BrickPoint alloc] initWithX:0 withY:-2];
            point3 = [[BrickPoint alloc] initWithX:1 withY:-2];
            point4 = [[BrickPoint alloc] initWithX:1 withY:-1];
        }
            break;
            
        default:
        {
            point1 = [[BrickPoint alloc] initWithX:0 withY:-1];
            point2 = [[BrickPoint alloc] initWithX:1 withY:-1];
            point3 = [[BrickPoint alloc] initWithX:2 withY:-1];
            point4 = [[BrickPoint alloc] initWithX:3 withY:-1];
        }
            break;
        }
    [brickPoints addObject:point1];
    [brickPoints addObject:point2];
    [brickPoints addObject:point3];
    [brickPoints addObject:point4];
    return brickPoints;
}

- (BrickPoint*)getCenterPositionOfBricks:(NSArray<BrickView*>*)brickArray{
    __block NSInteger min_x = 9999;
    __block NSInteger min_y = 9999;
    __block NSInteger max_x = -9999;
    __block NSInteger max_y = -9999;
    [brickArray enumerateObjectsUsingBlock:^(BrickView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            BrickPoint* point = obj.point;
            min_x = MIN(min_x, point.x);
            min_y = MIN(min_y, point.y);
            max_x = MAX(max_x, point.x);
            max_y = MAX(max_y, point.y);
    }];
    NSInteger center_y = min_y + ABS(min_y - max_y) / 2;
  
    NSInteger center_x = min_x + ABS(min_x - max_x) / 2;
    return [[BrickPoint alloc]initWithX:center_x withY:center_y];
    
}


- (BrickPoint*)getCenterPositionOfBricksPoints:(NSArray<BrickPoint*>*)brickArray{
    __block NSInteger min_x = 9999;
    __block NSInteger min_y = 9999;
    __block NSInteger max_x = -9999;
    __block NSInteger max_y = -9999;
    [brickArray enumerateObjectsUsingBlock:^(BrickPoint * _Nonnull point, NSUInteger idx, BOOL * _Nonnull stop) {
            min_x = MIN(min_x, point.x);
            min_y = MIN(min_y, point.y);
            max_x = MAX(max_x, point.x);
            max_y = MAX(max_y, point.y);
    }];
    NSInteger center_y = min_y + ABS(min_y - max_y) / 2;
  
    NSInteger center_x = min_x + ABS(min_x - max_x) / 2;
    return [[BrickPoint alloc]initWithX:center_x withY:center_y];
}
- (BrickType)brickReversed:(BrickType)type{
    
    switch (type) {
       case BrickTypeI:
           return BrickTypeIR;
       case BrickTypeIR:
           return BrickTypeI;
       case BrickTypeL:
           return BrickTypeL1;
       case BrickTypeL1:
           return BrickTypeL2;
       case BrickTypeL2:
           return BrickTypeL3;
       case BrickTypeL3:
           return BrickTypeL;
       case BrickTypeLR:
           return BrickTypeLR1;
       case BrickTypeLR1:
           return BrickTypeLR2;
       case BrickTypeLR2:
           return BrickTypeLR3;
       case BrickTypeLR3:
           return BrickTypeLR;
       case BrickTypeO:
           return BrickTypeO;
       case BrickTypeT:
           return BrickTypeT1;
       case BrickTypeT1:
           return BrickTypeT2;
       case BrickTypeT2:
           return BrickTypeT3;
       case BrickTypeT3:
           return BrickTypeT;
       case BrickTypeZ:
           return BrickTypeZ1;
       case BrickTypeZ1:
           return BrickTypeZ;
       case BrickTypeZR:
           return BrickTypeZR1;
       case BrickTypeZR1:
           return BrickTypeZR;
               
       default:
           break;
       }
}


@end



