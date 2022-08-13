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

typedef NS_ENUM(NSInteger, BrickType){
    BrickTypeI,
    BrickTypeIR,
};

NS_ASSUME_NONNULL_BEGIN

@interface Constant : NSObject

@end

NS_ASSUME_NONNULL_END
