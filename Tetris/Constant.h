//
//  Constant.h
//  Tetris
//
//  Created by T D on 2022/8/13.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

extern NSInteger boardWidth;
extern NSInteger boardHeight;
extern NSInteger gridSize;


static inline NSInteger gridToFrame(NSInteger val){
    return val * gridSize;
}


// 方块类型
typedef NS_ENUM(NSInteger, BrickType){
    BrickTypeI,
    BrickTypeIR,
};


// 方块移动方向
typedef NS_ENUM(NSInteger, BrickDirection) {
    BrickDirectionDown = 0,
    BrickDirectionLeft,
    BrickDirectionRight
};

NS_ASSUME_NONNULL_BEGIN

@interface Constant : NSObject

@end

NS_ASSUME_NONNULL_END
