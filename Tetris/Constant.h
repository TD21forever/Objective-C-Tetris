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
    
    // I 两种
    // L 四种
    // J 四种
    // S 两种
    // Z 两种
    // T 四种
    // 田 一种
    
    // base type
    BrickTypeI = 0,       // I型
    BrickTypeIR,          // 反I型
    BrickTypeL,           // L型
    BrickTypeLR,          // 反L型
    BrickTypeO,           // 田字型
    BrickTypeT,           // T型
    BrickTypeZ,           // Z型
    BrickTypeZR,          // 反Z型
    
    // reversal type
    BrickTypeL1,          // L1型
    BrickTypeL2,          // L2型
    BrickTypeL3,          // L3型
    BrickTypeLR1,         // 反L型1
    BrickTypeLR2,         // 反L型2
    BrickTypeLR3,         // 反L型3
    BrickTypeT1,          // T型1
    BrickTypeT2,          // T型2
    BrickTypeT3,          // T型3
    BrickTypeZ1,          // Z型1
    BrickTypeZR1,         // 反Z型1
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
