//
//  Brick.h
//  Tetris
//
//  Created by T D on 2022/8/13.
//

#import <Foundation/Foundation.h>
#import "Constant.h"

NS_ASSUME_NONNULL_BEGIN

@interface BrickManager : NSObject

+ (instancetype)shared;

- (NSArray*)getBrickPoints:(BrickType)type;

@end



@interface BrickPoint : NSObject

- (instancetype)initWithX:(NSInteger)x withY:(NSInteger)y;
@property (nonatomic,assign) NSInteger x;
@property (nonatomic,assign) NSInteger y;

@end


NS_ASSUME_NONNULL_END
