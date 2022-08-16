//
//  BrickPoint.h
//  Tetris
//
//  Created by T D on 2022/8/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BrickPoint : NSObject


- (instancetype)initWithX:(NSInteger)x withY:(NSInteger)y;
@property (nonatomic,assign) NSInteger x;
@property (nonatomic,assign) NSInteger y;

@end

NS_ASSUME_NONNULL_END
