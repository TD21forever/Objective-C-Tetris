//
//  Brick.h
//  Tetris
//
//  Created by T D on 2022/8/13.
//

#import <Foundation/Foundation.h>
#import "Constant.h"
#import "BrickPoint.h"


NS_ASSUME_NONNULL_BEGIN

@interface BrickView : UIView

@property (nonatomic,strong) BrickPoint* point;

- (instancetype)initWithFrame:(CGRect)frame point:(BrickPoint*)point;

@end

NS_ASSUME_NONNULL_END
