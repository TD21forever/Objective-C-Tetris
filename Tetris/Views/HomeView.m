//
//  HomeView.m
//  Tetris
//
//  Created by T D on 2022/8/13.
//

#import "HomeView.h"

@interface HomeView ()

@property (nonatomic,strong) BoardView* board;

@end


@implementation HomeView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self addSubview:self.board];
    }
    return self;
}

- (BoardView*)board{
    if(!_board){
        _board = [[BoardView alloc]initWithFrame:CGRectMake(0, 0, 100, 200)];
    }
    return _board;
}

@end
