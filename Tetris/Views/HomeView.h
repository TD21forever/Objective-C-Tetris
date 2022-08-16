//
//  HomeView.h
//  Tetris
//
//  Created by T D on 2022/8/13.
//

#import <UIKit/UIKit.h>
#import "BoardView.h"
#import "BrickView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol HomeViewDelegate <NSObject>

- (void)playClick;
- (void)leftClick;
- (void)rightClick;
- (void)downClick;
- (void)reverseClick;
- (void)pauseClick;
- (void)restartClick;

@end


@interface HomeView : UIView
@property (nonatomic,strong) BoardView* board;
@property (nonatomic,weak) id<HomeViewDelegate> delegate;
@property (nonatomic,weak) void (^scoreUpdateBlock)(NSInteger score) ;

@property (nonatomic,assign) NSInteger scores;
@property (nonatomic,strong) NSArray<BrickView*>* nextBricks;

@end

NS_ASSUME_NONNULL_END
