//
//  Brick.h
//  Tetris
//
//  Created by T D on 2022/8/13.
//

#import <Foundation/Foundation.h>
#import "Constant.h"
#import "BrickView.h"
#import "BrickPoint.h"

NS_ASSUME_NONNULL_BEGIN




@interface BrickManager : NSObject

+ (instancetype)shared;

- (NSArray*)getBrickPoints:(BrickType)type;

- (BrickPoint*)getCenterPositionOfBricks:(NSArray<BrickView*>*)brickArray;

- (BrickPoint*)getCenterPositionOfBricksPoints:(NSArray<BrickPoint*>*)brickArray;

- (NSInteger)getBricksWidth:(BrickType)type;

- (BrickType)brickReversed:(BrickType)type;


@end




NS_ASSUME_NONNULL_END
