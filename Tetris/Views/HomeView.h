//
//  HomeView.h
//  Tetris
//
//  Created by T D on 2022/8/13.
//

#import <UIKit/UIKit.h>
#import "BoardView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol HomeViewDelegate <NSObject>

- (void)playClick;
- (void)leftClick;
- (void)rightClick;
- (void)downClick;
- (void)reverseClick;
- (void)pauseClick;

@end


@interface HomeView : UIView
@property (nonatomic,strong) BoardView* board;
@property (nonatomic,weak) id<HomeViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
